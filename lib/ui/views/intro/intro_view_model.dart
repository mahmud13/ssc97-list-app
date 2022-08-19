import 'package:localstorage/localstorage.dart';
import 'package:mgcs_app/app/app.locator.dart';
import 'package:mgcs_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:mgcs_app/app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

class IntroViewModel extends BaseViewModel {
  final log = getLogger('Intro');
  final _navigationService = locator<NavigationService>();
  final LocalStorage storage = LocalStorage('mgcs_app');
  late int totalSteps;
  int _activeStep = 0;
  int get activeStep => _activeStep;

  IntroViewModel() {
    log.i('initiated');
  }
  void onModelReady({required int totalSteps}) {
    this.totalSteps = totalSteps;
  }

  set activeStep(int value) {
    _activeStep = value;
    notifyListeners();
  }

  void goNext() {
    if (_activeStep < totalSteps - 1) {
      activeStep = activeStep + 1;
    }
  }

  void goPrev() {
    if (_activeStep > 0) {
      activeStep = activeStep - 1;
    }
  }

  void navigateToLogin() {
    _navigationService.navigateTo(Routes.homeView);
  }
}
