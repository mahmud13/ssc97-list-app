import 'package:stacked/stacked.dart';
import 'package:mgcs_app/app/app.logger.dart';

class SplashScreenViewModel extends BaseViewModel {
  final log = getLogger('SplashScreenViewModel');
  SplashScreenViewModel() {
    log.i('initiated');
  }
  void callSomething() {
    log.v("hey I'm calling");
  }
}
