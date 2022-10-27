import 'package:ssc_97/app/app.locator.dart';
import 'package:ssc_97/models/user/user.dart';
import 'package:ssc_97/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:ssc_97/app/app.logger.dart';

class ProfileViewModel extends BaseViewModel {
  final log = getLogger('ProfileViewModel');
  final _authService = locator<AuthenticationService>();

  User? get user => _authService.user;

  ProfileViewModel() {
    log.i('initiated');
  }
}
