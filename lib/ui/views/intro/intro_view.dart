import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:mgcs_app/ui/views/intro/intro_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:mgcs_app/generated/l10n.dart';

class IntroView extends StatelessWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return ViewModelBuilder<IntroViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.close_outlined,
                      color: theme.primaryColor,
                      size: 32,
                    ),
                  ),
                ),
                Text(
                  'Welcome to Tadrib',
                  style: theme.textTheme.headline4,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: DotStepper(
                    activeStep: model.activeStep,
                    dotCount: model.totalSteps,
                    dotRadius: 9,
                    spacing: 10,
                    shape: Shape.circle,
                    indicator: Indicator.shift,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: model.activeStep > 0 ? model.goPrev : null,
                      child: const Text('Previous'),
                    ),
                    ElevatedButton(
                      onPressed: () => model.goNext(),
                      child: const Text('Next'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => IntroViewModel(),
      onModelReady: (model) => model.onModelReady(totalSteps: 4),
    );
  }
}
