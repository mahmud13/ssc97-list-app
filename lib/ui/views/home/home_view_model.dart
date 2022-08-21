import 'package:mgcs_app/app/app.locator.dart';
import 'package:mgcs_app/models/user/user.dart';
import 'package:mgcs_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:mgcs_app/app/app.logger.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('Home');
  final _authService = locator<AuthenticationService>();

  User? get user => _authService.user;

  HomeViewModel() {
    log.i('initiated');
  }
}
