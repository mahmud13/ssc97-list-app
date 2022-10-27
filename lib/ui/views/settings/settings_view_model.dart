import 'package:ssc_97/app/app.locator.dart';
import 'package:ssc_97/models/user/user.dart';
import 'package:ssc_97/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:ssc_97/app/app.logger.dart';

class SettingsViewModel extends BaseViewModel {
  final log = getLogger('SettingsViewModel');
  final _authService = locator<AuthenticationService>();

  User? get user => _authService.user;

  SettingsViewModel() {
    log.i('initiated');
  }
}
