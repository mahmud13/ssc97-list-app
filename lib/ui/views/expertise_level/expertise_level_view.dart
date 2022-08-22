import 'package:flutter/material.dart';
import 'package:mgcs_app/ui/views/expertise_level/expertise_level_view_model.dart';
import 'package:mgcs_app/ui/views/intro/ui_helpers.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Choose expertise level',
                  style: TextStyle(fontSize: 24),
                ),
                verticalSpaceMedium,
                Slider(
                  value: model.selectedExpertise,
                  min: 0,
                  max: 2,
                  divisions: 2,
                  label: model.label,
                  onChanged: (value) {
                    model.selectedExpertise = value;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var exp in model.expertises) Text(exp),
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
