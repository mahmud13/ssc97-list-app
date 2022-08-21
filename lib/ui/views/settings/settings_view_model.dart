import 'package:mgcs_app/app/app.locator.dart';
import 'package:mgcs_app/models/user/user.dart';
import 'package:mgcs_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:mgcs_app/app/app.logger.dart';

class SettingsViewModel extends BaseViewModel {
  final log = getLogger('SettingsViewModel');
  final _authService = locator<AuthenticationService>();

  User? get user => _authService.user;

  SettingsViewModel() {
    log.i('initiated');
  }
}
