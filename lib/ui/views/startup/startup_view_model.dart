import 'dart:async';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mgcs_app/app/app.locator.dart';
import 'package:mgcs_app/app/app.router.dart';
import 'package:mgcs_app/app/localstorage.dart';
import 'package:stacked/stacked.dart';
import 'package:mgcs_app/app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartupViewModel');
  final _navigationService = locator<NavigationService>();

  StartupViewModel() {
    log.i('initiated');
  }

  void onModelReady() {
    log.v('redirecting to home/intro after 3 seconds');
    Timer(const Duration(seconds: 0), () => redirectToNext());
  }

  void redirectToNext() async {
    log.v('removing splash');
    FlutterNativeSplash.remove();

    log.v('Checking if first time user');

    var localstorage = await getLocalStorage();
    if (localstorage.getBool('introShown') == true) {
      log.v('Already show, redirecting to home');
      _navigationService.navigateTo(Routes.homeView);
    } else {
      log.v('New comer, showing intro screen');
      _navigationService.navigateTo(Routes.introView);
    }
  }
}
