import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mgcs_app/config.dart' as config;
import 'package:mgcs_app/ui/views/practice/practice_view_model.dart';
import 'package:stacked/stacked.dart';

import 'answer_widget_audio.dart';

class AnswerWidget extends ViewModelWidget<PracticeViewModel> {
  const AnswerWidget({super.key});

  @override
  Widget build(BuildContext context, PracticeViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          viewModel.currentWord!.word,
          style: const TextStyle(fontSize: 40),
        ),
        Text(
          viewModel.currentWord!.transliteration,
          style: const TextStyle(fontSize: 30),
        ),
        CachedNetworkImage(
          height: 100,
          width: 200,
          imageUrl:
              "${config.apiUrl}/files?path=${viewModel.currentWord!.picture}",
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: ((context, url, error) => const Text('No Image')),
        ),
        AnswerWidgetAudio(
          onStopRecording: (file) {
            viewModel.currentRecording = file;
            viewModel.showFeedback();
          },
        ),
      ],
    );
  }
}
