import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:mgcs_app/generated/l10n.dart';
import 'package:mgcs_app/ui/views/splash_screen/splash_screen_view_model.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(title: const Text("data")),
          body: Column(
            children: [
              Text(s.Hello),
              ElevatedButton(
                onPressed: () => model.callSomething(),
                child: const Text('oh you'),
              )
            ],
          ),
        );
      },
      viewModelBuilder: () => SplashScreenViewModel(),
    );
  }
}
