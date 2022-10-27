import 'package:flutter_sound/flutter_sound.dart';
import 'package:ssc_97/app/http_client.dart';
import 'package:ssc_97/models/api_helpers/api_wrapper.dart';
import 'package:ssc_97/models/words/word.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:ssc_97/app/app.logger.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';

class AnswerViewModel extends FutureViewModel {
  final log = getLogger('AnswerViewModel');
  final dio = getDio();
  List<Word> words = [];
  Word? currentWord;
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _isRecorderInited = false;

  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  bool _isPlayerInited = false;
  bool _isPlaybackReady = false;
  final String _fileName = 'testfile.mp4';

  AnswerViewModel() {
    log.i('initiated');
  }

  Future fetchWords() async {
    try {
      var response = await dio.get('/words');
      var result = ApiResult.fromResponseAsList(response, Word.fromJson);
      if (result is Success<List<Word>>) {
        words = result.data;
        if (words.isNotEmpty) {
          currentWord = words.first;
        }
      }
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  Future<void> checkPermission() async {
    var status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }
    await _recorder.openRecorder();
    _isRecorderInited = true;
  }

  Future<void> stopRecording() async {
    if (_recorder.isRecording) {
      await _recorder.stopRecorder();
      if (!_isPlayerInited) {
        await _player.openPlayer();
        _isPlayerInited = true;
      }
      _isPlaybackReady = true;
    }
  }

  Future<void> startRecording() async {
    if (!_isRecorderInited) {
      await checkPermission();
    } else if (!_recorder.isRecording) {
      await _recorder.startRecorder(
        codec: Codec.aacMP4,
        toFile: _fileName,
        audioSource: AudioSource.microphone,
      );
    }
  }

  Future<void> play() async {
    if (_isPlaybackReady && _recorder.isStopped && _player.isStopped) {
      _player.startPlayer(fromURI: _fileName);
    }
  }

  @override
  Future futureToRun() async {
    await fetchWords();
  }
}
