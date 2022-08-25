import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mgcs_app/app/snackbars.dart';
import 'package:mgcs_app/services/authentication_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:mgcs_app/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

Future main() async {
  var widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  setupSnackbarUi();
  var authService = locator<AuthenticationService>();
  await authService.initializeAuth();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'MGCS',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: (settings) => StackedRouter().onGenerateRoute(
          _guardedSettings(settings),
        ),
      );

  RouteSettings _guardedSettings(RouteSettings settings) {
    final authService = locator<AuthenticationService>();
    final path = settings.name;
    var signedIn = authService.loggedIn;
    // if you want a path to always be allowed place before your route guards
    if (path == Routes.introView || path == Routes.startupView) return settings;

    // auth route guard implementation
    if (!signedIn && path != Routes.loginView) {
      return const RouteSettings(name: Routes.loginView);
    }
    if (authService.user != null &&
        authService.user!.wordDifficulty == null &&
        path == Routes.homeView) {
      return const RouteSettings(name: Routes.expertiseLevelView);
    }

    // no route guards violated, return the settings for the desired route
    return settings;
  }
}
