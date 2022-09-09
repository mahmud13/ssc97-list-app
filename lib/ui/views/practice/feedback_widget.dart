import 'package:flutter/material.dart';
import 'package:mgcs_app/ui/views/intro/ui_helpers.dart';
import 'package:mgcs_app/ui/views/practice/practice_view_model.dart';
import 'package:stacked/stacked.dart';

class FeedbackWidget extends ViewModelWidget<PracticeViewModel> {
  const FeedbackWidget({super.key});

  @override
  Widget build(BuildContext context, PracticeViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var c in [
              {'l': '\ufee3\ufe77', 'c': 'aqua'},
              {'l': '\ufeb4\ufe7f', 'c': 'blue'},
              {'l': '\ufea0\ufe7b', 'c': 'green'},
              {'l': '\ufeaa', 'c': 'green'},
            ].reversed)
              Text(
                c['l'] ?? '',
                style: TextStyle(
                  color: c['c'] == 'blue'
                      ? Colors.blue
                      : c['c'] == 'green'
                          ? Colors.yellow
                          : Colors.red,
                  fontSize: 44,
                ),
              )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var c in [
              {'m': 'aqua'},
              {'a': 'blue'},
              {'s': 'green'},
              {'j': 'aqua'},
              {'i': 'blue'},
              {'d': 'green'},
            ])
              Text(
                c.keys.first,
                style: TextStyle(
                  color: c.values.first == 'blue'
                      ? Colors.blue
                      : c.values.first == 'green'
                          ? Colors.yellow
                          : Colors.red,
                  fontSize: 34,
                ),
              )
          ],
        ),
        verticalSpaceMedium,
        const Text('Practice Correct form using the options below'),
        verticalSpaceLarge,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: const [
                ImageIcon(
                  AssetImage('assets/icons/hear.png'),
                  size: 40,
                ),
                Text('Hear')
              ],
            ),
            horizontalSpaceLarge,
            Column(
              children: const [
                ImageIcon(
                  AssetImage('assets/icons/soundwave.png'),
                  size: 40,
                ),
                Text('Soundwave')
              ],
            ),
          ],
        ),
        verticalSpaceLarge,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ImageIcon(
              AssetImage('assets/icons/prev.png'),
              size: 40,
            ),
            horizontalSpaceMedium,
            ImageIcon(
              AssetImage('assets/icons/replay.png'),
              size: 40,
            ),
            horizontalSpaceMedium,
            ImageIcon(
              AssetImage('assets/icons/next.png'),
              size: 40,
            ),
          ],
        ),
      ],
    );
  }
}
