import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:ssc_97/ui/views/intro/intro_view_model.dart';
import 'package:stacked/stacked.dart';

import 'intro_slides_view.dart';

class IntroView extends StatelessWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<IntroViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragEnd: (details) {
              int sensitivity = 8;
              if (details.primaryVelocity != null &&
                  details.primaryVelocity! > sensitivity) {
                model.goPrev();
              } else if (details.primaryVelocity != null &&
                  details.primaryVelocity! < -sensitivity) {
                model.goNext();
              }
            },
            child: SafeArea(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: model.navigateToLogin,
                        icon: Icon(
                          Icons.close_outlined,
                          color: theme.primaryColor,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: activeWidget(model.activeStep),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: DotStepper(
                      indicatorDecoration: IndicatorDecoration(
                          color: theme.primaryColor, strokeWidth: 3),
                      activeStep: model.activeStep,
                      dotCount: model.totalSteps,
                      dotRadius: 9,
                      spacing: 10,
                      shape: Shape.circle,
                      indicator: Indicator.shift,
                      onDotTapped: ((tappedDotIndex) {
                        model.activeStep = tappedDotIndex;
                      }),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     ElevatedButton(
                  //       onPressed: model.activeStep > 0 ? model.goPrev : null,
                  //       child: const Text('Previous'),
                  //     ),
                  //     ElevatedButton(
                  //       onPressed: () => model.goNext(),
                  //       child: const Text('Next'),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => IntroViewModel(),
      onModelReady: (model) => model.onModelReady(totalSteps: 4),
    );
  }

  Widget activeWidget(int activeStep) {
    switch (activeStep) {
      case 0:
        return const IntroSlide1();
      case 1:
        return const IntroSlide2();
      case 2:
        return const IntroSlide3();
      case 3:
        return const IntroSlide4();
      default:
        return Container();
    }
  }
}
