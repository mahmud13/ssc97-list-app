import 'dart:async';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mgcs_app/app/app.locator.dart';
import 'package:mgcs_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:mgcs_app/app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartupViewModel');
  final _navigationService = locator<NavigationService>();
  final LocalStorage storage = LocalStorage('mgcs_app');

  StartupViewModel() {
    log.i('initiated');
  }

  void onModelReady() {
    log.v('redirecting to home/intro after 3 seconds');
    Timer(const Duration(seconds: 3), () => redirectToNext());
  }

  void redirectToNext() {
    log.v('removing splash');
    FlutterNativeSplash.remove();

    log.v('Checking if first time user');

    if (storage.getItem('introShown') == true) {
      log.v('Already show, redirecting to home');
      _navigationService.navigateTo(Routes.homeView);
    } else {
      log.v('New comer, showing intro screen');
      _navigationService.navigateTo(Routes.introView);
    }
  }
}