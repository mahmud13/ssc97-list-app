import 'package:flutter/material.dart';
import 'package:mgcs_app/ui/views/intro/ui_helpers.dart';
import 'package:mgcs_app/ui/views/practice/feedback_widget_audio.dart';
import 'package:mgcs_app/ui/views/practice/practice_view_model.dart';
import 'package:stacked/stacked.dart';

class FeedbackWidget extends ViewModelWidget<PracticeViewModel> {
  const FeedbackWidget({super.key});

  @override
  Widget build(BuildContext context, PracticeViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          softWrap: true,
          textWidthBasis: TextWidthBasis.longestLine,
          text: const TextSpan(children: [
            TextSpan(
              text: "م",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 48,
                fontFamily: "uthmanic",
              ),
            ),
            TextSpan(
              text: "ؘ", //Diacritic
              style: TextStyle(
                color: Colors.red,
                fontSize: 48,
                fontFamily: "uthmanic",
              ),
            ),
            TextSpan(
              text: "س",
              style: TextStyle(
                color: Colors.green,
                fontSize: 48,
                fontFamily: "uthmanic",
              ),
            ),
            TextSpan(
              text: "۫",
              style: TextStyle(
                color: Colors.green,
                fontSize: 48,
                fontFamily: "uthmanic",
              ),
            ),
            TextSpan(
              text: "ج",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 48,
                fontFamily: "uthmanic",
              ),
            ),
            TextSpan(
              text: "ؚ",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 48,
                fontFamily: "uthmanic",
              ),
            ),
            TextSpan(
              text: "د",
              style: TextStyle(
                color: Colors.red,
                fontSize: 48,
                fontFamily: "uthmanic",
              ),
            ),
          ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var c in [
              {'m': 0xff11ff11},
              {'a': 0xffff0000},
              {'s': 0xff111111},
              {'j': 0xff111111},
              {'i': 0xff111111},
              {'d': 0xff1144ff},
            ])
              Text(
                c.keys.first,
                style: TextStyle(
                  color: Color(c.values.first),
                  fontSize: 34,
                ),
              )
          ],
        ),
        verticalSpaceMedium,
        const Text('Practice Correct form using the options below'),
        verticalSpaceLarge,
        FeedbackWidgetAudio(audio: viewModel.currentWord!.audio),
        verticalSpaceMedium,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ImageIcon(
              AssetImage('assets/icons/prev.png'),
              size: 40,
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
