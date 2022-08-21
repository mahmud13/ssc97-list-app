import 'package:flutterfire_ui/auth.dart';
import 'package:mgcs_app/app/app.locator.dart';
import 'package:mgcs_app/app/app.logger.dart';
import 'package:mgcs_app/app/app.router.dart';
import 'package:mgcs_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final log = getLogger('LoginView');
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  LoginViewModel() {
    log.i('initiated');
  }
  void login(SignedIn state) async {
    if (state.user != null) {
      log.i('user login success');
      await _authService.loginWithFirebase(
        firebaseToken: await state.user!.getIdToken(),
        firebaseUid: state.user!.uid,
      );
      log.i('User logged in. Redirecting to home');
      navigateToHome();
    }
  }

  void navigateToHome() {
    _navigationService.replaceWith(Routes.homeView);
  }
}
