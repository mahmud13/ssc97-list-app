import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:mgcs_app/generated/l10n.dart';
import 'package:mgcs_app/ui/views/splash_screen/splash_screen_view_model.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    s.tadrib,
                    style: TextStyle(fontSize: 93, color: theme.primaryColor),
                  ),
                  Image.asset(
                    'assets/images/splash.png',
                    width: 122,
                  )
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => SplashScreenViewModel(),
      onModelReady: (model) => model.onModelReady(),
    );
  }
}
