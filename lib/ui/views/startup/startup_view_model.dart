import 'dart:async';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ssc_97/app/app.locator.dart';
import 'package:ssc_97/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:ssc_97/app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartupViewModel');
  final _navigationService = locator<NavigationService>();

  StartupViewModel() {
    log.i('initiated');
  }

  void onModelReady() {
    log.v('redirecting to home/intro after 3 seconds');
    Timer(const Duration(seconds: 1), () => redirectToNext());
  }

  void redirectToNext() async {
    log.v('removing splash');
    FlutterNativeSplash.remove();

    log.v('Checking if first time user');

    _navigationService.replaceWith(Routes.homeView);
  }
}
