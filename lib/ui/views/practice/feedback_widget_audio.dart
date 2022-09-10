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

class FeedbackWidgetAudio extends StatelessWidget {
  final String audio;
  const FeedbackWidgetAudio({super.key, required this.audio});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedbackWidgetAudioViewModel>.reactive(
      viewModelBuilder: () => FeedbackWidgetAudioViewModel(audio: audio),
      builder: (context, model, child) => TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
        ),
        onPressed: () {
          model.play();
        },
        child: Column(
          children: const [
            ImageIcon(
              AssetImage('assets/icons/hear.png'),
              size: 40,
            ),
            Text('Hear')
          ],
        ),
      ),
    );
  }
}

class FeedbackWidgetAudioViewModel extends BaseViewModel {
  final String audio;
  final _player = FlutterSoundPlayer();
  bool _playerIsInited = false;
  FeedbackWidgetAudioViewModel({required this.audio});

  Future<void> initPlayer() async {
    await _player.openPlayer();
    _playerIsInited = true;
  }

  Future<void> play() async {
    if (!_playerIsInited) {
      initPlayer();
    }
    if (!_player.isPlaying) {
      await _player.startPlayer(fromURI: audio, codec: Codec.aacMP4);
    }
  }
}
