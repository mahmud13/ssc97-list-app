import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:stacked/stacked.dart';

class FeedbackWidgetAudio extends StatelessWidget {
  final String audio;
  const FeedbackWidgetAudio({super.key, required this.audio});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedbackWidgetAudioViewModel>.reactive(
      viewModelBuilder: () => FeedbackWidgetAudioViewModel(audio: audio),
      builder: (context, model, child) => GestureDetector(
        onDoubleTap: () {
          model.playWithSlowMo();
        },
        child: TextButton(
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
      _player.setSpeed(1.0);
      await _player.startPlayer(
        fromURI: audio,
        codec: Codec.aacMP4,
      );
    }
  }

  Future<void> playWithSlowMo() async {
    _player.setSpeed(0.4);
    await _player.startPlayer(
      fromURI: audio,
      codec: Codec.aacMP4,
    );
  }
}
