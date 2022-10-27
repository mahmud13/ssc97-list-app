import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:ssc_97/ui/views/auth/login_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var l = Localizations.localeOf(context);
    const providerConfigs = [
      EmailProviderConfiguration(),
      PhoneProviderConfiguration(),
    ];
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, widget) => SignInScreen(
        providerConfigs: providerConfigs,
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            model.login(state);
          }),
        ],
      ),
    );
  }
}
