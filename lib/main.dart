import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:mgcs_app/generated/l10n.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

Future main() async {
  var widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  setupLocator();
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
    final path = settings.name;
    const signedIn = false;

    // if you want a path to always be allowed place before your route guards
    if (path == Routes.introView) return settings;

    // auth route guard implementation
    if (!signedIn && path != Routes.loginView) {
      return const RouteSettings(name: Routes.loginView);
    }

    // no route guards violated, return the settings for the desired route
    return settings;
  }
}
