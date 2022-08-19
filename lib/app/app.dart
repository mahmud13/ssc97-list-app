import 'package:mgcs_app/ui/views/auth/login_view.dart';
import 'package:mgcs_app/ui/views/home/home_view.dart';
import 'package:mgcs_app/ui/views/intro/intro_view.dart';
import 'package:mgcs_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, path: '/', initial: true),
    MaterialRoute(page: IntroView, path: '/intro'),
    MaterialRoute(page: HomeView, path: '/home'),
    MaterialRoute(page: LoginView, path: '/login'),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
  logger: StackedLogger(),
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
