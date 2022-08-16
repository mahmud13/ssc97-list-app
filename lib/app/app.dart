import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:mgcs_app/ui/views/splash_screen/splash_screen_view.dart';

@StackedApp(
  routes: [MaterialRoute(page: SplashScreenView, initial: true)],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
  logger: StackedLogger(),
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
