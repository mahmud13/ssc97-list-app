import 'package:mgcs_app/app/app.locator.dart';
import 'package:mgcs_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeLayoutViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  void onTap(int i) {
    var routes = [
      Routes.homeView,
      Routes.trackView,
      Routes.settingsView,
      Routes.profileView,
    ];
    _navigationService.navigateTo(routes[i]);
  }
}
