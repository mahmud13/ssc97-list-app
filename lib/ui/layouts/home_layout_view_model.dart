import 'package:ssc_97/app/app.locator.dart';
import 'package:ssc_97/app/app.router.dart';
import 'package:ssc_97/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeLayoutViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  void onTap(int i) {
    var routes = [
      Routes.homeView,
      Routes.trackView,
      Routes.settingsView,
      Routes.profileView,
    ];
    _navigationService.navigateTo(routes[i]);
  }

  Future<void> syncGoogle() async {
    await _authService.syncDataFromGoogleSheet();
  }
}
