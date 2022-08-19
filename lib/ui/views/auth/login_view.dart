import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:mgcs_app/ui/views/auth/login_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const providerConfigs = [EmailProviderConfiguration()];
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
