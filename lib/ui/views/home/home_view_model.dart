import 'package:localstorage/localstorage.dart';
import 'package:mgcs_app/app/app.locator.dart';
import 'package:mgcs_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:mgcs_app/app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('Home');
  final _navigationService = locator<NavigationService>();
  final LocalStorage storage = LocalStorage('mgcs_app');

  HomeViewModel() {
    log.i('initiated');
   
  }
 
}
