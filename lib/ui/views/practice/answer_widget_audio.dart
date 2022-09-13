import 'dart:async';
import 'dart:io';
import 'dart:typed_data' show Uint8List;

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';

const int tSAMPLERATE = 8000;

class AnswerWidgetAudio extends StatelessWidget {
  final Function onStopRecording;
  const AnswerWidgetAudio({super.key, required this.onStopRecording});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AnswerWidgetAudioViewModel>.reactive(
      viewModelBuilder: () =>
          AnswerWidgetAudioViewModel(onStopRecording: onStopRecording),
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 12.0, bottom: 16.0),
            child: Text(
              model.recorderTxt,
              style: const TextStyle(
                fontSize: 35.0,
                color: Colors.black,
              ),
            ),
          ),
          model.isRecording
              ? LinearProgressIndicator(
                  value: 100.0 / 160.0 * (model.dbLevel ?? 1) / 100,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                  backgroundColor: Colors.red)
              : Container(),
          SizedBox(
            width: 56.0,
            height: 50.0,
            child: ClipOval(
              child: IconButton(
                onPressed: model.onStartRecorderPressed(),
                //padding: EdgeInsets.all(8.0),
                icon: (model.recorderModule.isStopped)
                    ? const Icon(Icons.mic)
                    : const Icon(Icons.stop),
              ),
            ),
          ),
          Text(model.isRecording ? 'Tap to stop' : 'Tap to speak'),
        ],
      ),
    );
  }
}

class AnswerWidgetAudioViewModel extends BaseViewModel {
  bool _isRecording = false;
  bool get isRecording => _isRecording;
  String? _path;

  bool _isRecorderInited = false;

  StreamSubscription? _recorderSubscription;
  StreamSubscription? _recordingDataSubscription;

  FlutterSoundRecorder recorderModule = FlutterSoundRecorder();

  String _recorderTxt = '00:00:00';
  String get recorderTxt => _recorderTxt;
  double? _dbLevel;
  double? get dbLevel => _dbLevel;

  double sliderCurrentPosition = 0.0;
  double maxDuration = 1.0;
  final Codec _codec = Codec.aacMP4;

  StreamController<Food>? recordingDataController;
  IOSink? sink;
  final Function onStopRecording;
  AnswerWidgetAudioViewModel({required this.onStopRecording});

  Future<void> openTheRecorder() async {
    var status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }
    await recorderModule.openRecorder();
  }

  Future<void> init() async {
    await openTheRecorder();
    await recorderModule
        .setSubscriptionDuration(const Duration(milliseconds: 10));
    await initializeDateFormatting();

    final session = await AudioSession.instance;
    await session.configure(
      AudioSessionConfiguration(
        avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
        avAudioSessionCategoryOptions:
            AVAudioSessionCategoryOptions.allowBluetooth |
                AVAudioSessionCategoryOptions.defaultToSpeaker,
        avAudioSessionMode: AVAudioSessionMode.spokenAudio,
        avAudioSessionRouteSharingPolicy:
            AVAudioSessionRouteSharingPolicy.defaultPolicy,
        avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
        androidAudioAttributes: const AndroidAudioAttributes(
          contentType: AndroidAudioContentType.speech,
          flags: AndroidAudioFlags.none,
          usage: AndroidAudioUsage.voiceCommunication,
        ),
        androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
        androidWillPauseWhenDucked: true,
      ),
    );

    _isRecorderInited = true;
  }

  void cancelRecorderSubscriptions() {
    if (_recorderSubscription != null) {
      _recorderSubscription!.cancel();
      _recorderSubscription = null;
    }
  }

  void cancelRecordingDataSubscription() {
    if (_recordingDataSubscription != null) {
      _recordingDataSubscription!.cancel();
      _recordingDataSubscription = null;
    }
    recordingDataController = null;
    if (sink != null) {
      sink!.close();
      sink = null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    cancelRecorderSubscriptions();
    cancelRecordingDataSubscription();
    releaseFlauto();
  }

  Future<void> releaseFlauto() async {
    await recorderModule.closeRecorder();
  }

  void startRecorder() async {
    try {
      if (_isRecorderInited == false) {
        init();
      }
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
      var tempDir = await getTemporaryDirectory();
      _path = '${tempDir.path}/flutter_sound${ext[_codec.index]}';

      await recorderModule.startRecorder(
        toFile: _path,
        codec: _codec,
        bitRate: 8000,
        numChannels: 1,
        sampleRate: tSAMPLERATE,
      );
      recorderModule.logger.d('startRecorder');

      _recorderSubscription = recorderModule.onProgress!.listen((e) {
        var date = DateTime.fromMillisecondsSinceEpoch(
            e.duration.inMilliseconds,
            isUtc: true);
        var txt = DateFormat('mm:ss:SS', 'en_GB').format(date);

        _recorderTxt = txt.substring(0, 8);
        _dbLevel = e.decibels;
        notifyListeners();
      });

      _isRecording = true;
      notifyListeners();
    } on Exception catch (err) {
      recorderModule.logger.e('startRecorder error: $err');
      stopRecorder();
      _isRecording = false;
      cancelRecordingDataSubscription();
      cancelRecorderSubscriptions();
      notifyListeners();
    }
  }

  void stopRecorder() async {
    try {
      await recorderModule.stopRecorder();
      recorderModule.logger.d('stopRecorder');
      cancelRecorderSubscriptions();
      cancelRecordingDataSubscription();
      if (_path != null) {
        onStopRecording(File(_path!));
      }
    } on Exception catch (err) {
      recorderModule.logger.d('stopRecorder error: $err');
    }
    _isRecording = false;
    notifyListeners();
  }

  Future<bool> fileExists(String path) async {
    return await File(path).exists();
  }

  // In this simple example, we just load a file in memory.This is stupid but just for demonstration  of startPlayerFromBuffer()
  Future<Uint8List?> makeBuffer(String path) async {
    try {
      if (!await fileExists(path)) return null;
      var file = File(path);
      file.openRead();
      var contents = await file.readAsBytes();
      return contents;
    } on Exception {
      return null;
    }
  }

  Future<Uint8List> getAssetData(String path) async {
    var asset = await rootBundle.load(path);
    return asset.buffer.asUint8List();
  }

  void pauseResumeRecorder() async {
    try {
      if (recorderModule.isPaused) {
        await recorderModule.resumeRecorder();
      } else {
        await recorderModule.pauseRecorder();
        assert(recorderModule.isPaused);
      }
    } on Exception catch (err) {
      recorderModule.logger.e('error: $err');
    }
  }

  void Function()? onPauseResumeRecorderPressed() {
    if (recorderModule.isPaused || recorderModule.isRecording) {
      return pauseResumeRecorder;
    }
    return null;
  }

  void startStopRecorder() {
    if (recorderModule.isRecording || recorderModule.isPaused) {
      stopRecorder();
      print("recorder stopped");
    } else {
      print("record starting........");
      startRecorder();
    }
  }

  void Function()? onStartRecorderPressed() {
    return startStopRecorder;
  }
}
