import 'package:mgcs_app/app/app.locator.dart';
import 'package:mgcs_app/models/user/user.dart';
import 'package:mgcs_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:mgcs_app/app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('Home');
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  User? get user => _authService.user;

  HomeViewModel() {
    log.i('initiated');
  }
}
