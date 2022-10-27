import 'package:ssc_97/app/app.locator.dart';
import 'package:ssc_97/app/app.router.dart';
import 'package:ssc_97/app/localstorage.dart';
import 'package:stacked/stacked.dart';
import 'package:ssc_97/app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

class IntroViewModel extends BaseViewModel {
  final log = getLogger('Intro');
  final _navigationService = locator<NavigationService>();
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

  void navigateToLogin() async {
    var localstorage = await getLocalStorage();
    localstorage.setBool('introShown', true);
    _navigationService.navigateTo(Routes.homeView);
  }
}
