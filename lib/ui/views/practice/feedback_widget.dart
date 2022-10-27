import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ssc_97/ui/views/intro/ui_helpers.dart';
import 'package:ssc_97/ui/views/practice/feedback_widget_audio.dart';
import 'package:ssc_97/ui/views/practice/practice_view_model.dart';
import 'package:stacked/stacked.dart';

class FeedbackWidget extends ViewModelWidget<PracticeViewModel> {
  const FeedbackWidget({super.key});

  @override
  Widget build(BuildContext context, PracticeViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image.memory(base64Decode(viewModel.currentAnswer!.feedback.arabic)),
        RatingBar.builder(
          initialRating: viewModel.currentAnswer!.accuracy * 3,
          ignoreGestures: true,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 3,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {},
        ),
        verticalSpaceMedium,
        RichText(
          softWrap: true,
          textWidthBasis: TextWidthBasis.longestLine,
          text: TextSpan(children: [
            for (var l in viewModel.currentAnswer!.feedback.arabic)
              TextSpan(
                text: l.letter,
                style: TextStyle(
                  color: Color(l.colorCode),
                  fontSize: 48,
                  fontFamily: "uthmanic",
                ),
              ),
          ]),
        ),
        // RichText(
        //   softWrap: true,
        //   textWidthBasis: TextWidthBasis.longestLine,
        //   text: TextSpan(children: [
        //     for (var l in viewModel.currentAnswer!.feedback.transliteration)
        //       TextSpan(
        //         text: l.letter,
        //         style: TextStyle(
        //           color: Color(l.colorCode),
        //           fontSize: 48,
        //           fontFamily: "uthmanic",
        //         ),
        //       ),
        //   ]),
        // ),
        Text(
          viewModel.currentWord!.transliteration,
          style: const TextStyle(fontSize: 30),
        ),
        verticalSpaceMedium,
        const Text('Practice Correct form using the options below'),
        verticalSpaceLarge,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FeedbackWidgetAudio(audio: viewModel.currentWord!.audio),
            FavoriteButton(
              valueChanged: viewModel.toggleLike,
              isFavorite: viewModel.currentWord!.isLiked,
            ),
          ],
        ),
        verticalSpaceMedium,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: viewModel.prev,
              icon: const ImageIcon(
                AssetImage('assets/icons/prev.png'),
                size: 40,
              ),
            ),
            horizontalSpaceMedium,
            IconButton(
              onPressed: viewModel.replay,
              icon: const ImageIcon(
                AssetImage('assets/icons/replay.png'),
                size: 40,
              ),
            ),
            horizontalSpaceMedium,
            IconButton(
              onPressed: viewModel.next,
              icon: const ImageIcon(
                AssetImage('assets/icons/next.png'),
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
