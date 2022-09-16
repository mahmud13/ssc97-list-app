import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:mgcs_app/config.dart';
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
        onPressed: model._player.isPlaying
            ? null
            : () {
                model.play();
              },
        child: Column(
          children: [
            model._player.isPlaying
                ? const CircularProgressIndicator()
                : const ImageIcon(
                    AssetImage('assets/icons/hear.png'),
                    size: 40,
                  ),
            const Text('Hear')
          ],
        ),
      ),
    );
  }
}

class FeedbackWidgetAudioViewModel extends BaseViewModel {
  final String api = '$apiUrl/files?path=';
  final String audio;
  final _player = FlutterSoundPlayer();
  bool _playerIsInited = false;
  bool _shouldPlaySlow = false;
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
      _player.setSpeed(_shouldPlaySlow ? 0.6 : 1);
      _shouldPlaySlow = !_shouldPlaySlow;
      await _player.startPlayer(
          fromURI: api + audio,
          codec: Codec.pcm16WAV,
          whenFinished: () {
            notifyListeners();
          });
    }
    notifyListeners();
  }
}
