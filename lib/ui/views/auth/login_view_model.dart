import 'package:flutterfire_ui/auth.dart';
import 'package:mgcs_app/app/app.locator.dart';
import 'package:mgcs_app/app/app.logger.dart';
import 'package:mgcs_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final log = getLogger('LoginView');
  final _navigationService = locator<NavigationService>();

  LoginViewModel() {
    log.i('initiated');
  }
  void login(SignedIn state) async {
    log.v(state);
  }

  void navigateToHome() {
    log.v('navigating to home');
    _navigationService.navigateTo(Routes.homeView);
  }
}
