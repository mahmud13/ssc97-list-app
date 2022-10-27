import 'package:flutter/material.dart';
import 'package:ssc_97/ui/views/expertise_level/expertise_level_view_model.dart';
import 'package:ssc_97/ui/views/intro/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class ExpertiseLevelView extends StatelessWidget {
  const ExpertiseLevelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExpertiseLevelViewModel>.reactive(
      viewModelBuilder: () => ExpertiseLevelViewModel(),
      builder: (context, model, widget) => Scaffold(
        body: SafeArea(
          child: Center(
            child: model.isBusy
                ? const CircularProgressIndicator()
                : model.difficulties.isEmpty
                    ? const Text('Sorry, no difficulties in DB')
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Choose expertise level',
                            style: TextStyle(fontSize: 24),
                          ),
                          verticalSpaceMedium,
                          Slider(
                            value: model.selectedDifficulty,
                            min: 0,
                            max: 2,
                            divisions: 2,
                            label: model.label,
                            onChanged: (value) {
                              model.selectedDifficulty = value;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (var diff in model.difficulties)
                                  Text(diff.name),
                              ],
                            ),
                          ),
                          verticalSpaceLarge,
                          ElevatedButton(
                            onPressed: model.goHome,
                            child: const Text('Start'),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
