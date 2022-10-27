import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ssc_97/app/snackbars.dart';
import 'package:ssc_97/services/authentication_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ssc_97/generated/l10n.dart';
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
        title: '97-99 P. Card Checker',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: (settings) => StackedRouter().onGenerateRoute(
          _guardedSettings(settings),
        ),
      );

  RouteSettings _guardedSettings(RouteSettings settings) {
    // no route guards violated, return the settings for the desired route
    return settings;
  }
}
