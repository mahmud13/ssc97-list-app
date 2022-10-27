import 'package:flutter/material.dart';
import 'package:ssc_97/ui/views/intro/intro_view_model.dart';
import 'package:ssc_97/ui/views/intro/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class IntroSlide1 extends StatelessWidget {
  const IntroSlide1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to QVoice',
            style: theme.textTheme.headline4,
          ),
          verticalSpaceMedium,
          const Text(
            'Your very own Arabic pronunciation coach!',
            textAlign: TextAlign.center,
          ),
          verticalSpaceMedium,
          const Text(
            'You can practice your pronuciation on a range of Arabic words and track your progress overtime.',
            textAlign: TextAlign.center,
          ),
          verticalSpaceMedium,
          const Text(
            'QVoice will help you to perceive and produce the right sounds while speaking.',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class IntroSlide2 extends StatelessWidget {
  const IntroSlide2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Each word'),
          Text(
            'مسجد',
            style: TextStyle(color: theme.primaryColor, fontSize: 32),
          ),
          const Text('is accompanied with its English transliteration'),
          Text(
            'masjid',
            style: TextStyle(color: theme.primaryColor, fontSize: 32),
          ),
          verticalSpaceSmall,
          const Text('and an illustration'),
          Image.asset('assets/images/mosque.png', width: 78),
          const Text('to help you identify and pronounce the word '),
        ],
      ),
    );
  }
}

class IntroSlide3 extends StatelessWidget {
  const IntroSlide3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'QVoice will analyse your Arabic pronunciation to give you a detailed assessment and score.',
            textAlign: TextAlign.center,
          ),
          Text(
            'مسجد',
            textAlign: TextAlign.center,
            style: TextStyle(color: theme.primaryColor, fontSize: 32),
          ),
          const Text('Errors will be highlighted'),
          Text(
            'masjid',
            style: TextStyle(color: theme.primaryColor, fontSize: 32),
          ),
          verticalSpaceSmall,
          const Text(
            'so that you can learn the correct pronunciation by comparing to expert articulation',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class IntroSlide4 extends ViewModelWidget<IntroViewModel> {
  const IntroSlide4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, IntroViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Get started with practicing and learning your Arabic',
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
              onPressed: viewModel.navigateToLogin,
              child: const Text('Login/Registration'))
        ],
      ),
    );
  }
}
