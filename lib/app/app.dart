import 'package:mgcs_app/ui/views/home/home_view.dart';
import 'package:mgcs_app/ui/views/intro/intro_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:mgcs_app/ui/views/splash_screen/splash_screen_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, path: '/', initial: true),
    MaterialRoute(page: IntroView, path: '/intro'),
    MaterialRoute(page: HomeView, path: '/home'),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
  logger: StackedLogger(),
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
