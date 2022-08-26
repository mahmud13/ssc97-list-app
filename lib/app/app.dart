import 'package:mgcs_app/services/authentication_service.dart';
import 'package:mgcs_app/ui/views/auth/login_view.dart';
import 'package:mgcs_app/ui/views/expertise_level/expertise_level_view.dart';
import 'package:mgcs_app/ui/views/home/home_view.dart';
import 'package:mgcs_app/ui/views/intro/intro_view.dart';
import 'package:mgcs_app/ui/views/practice/practice_view.dart';
import 'package:mgcs_app/ui/views/profile/profile_view.dart';
import 'package:mgcs_app/ui/views/settings/settings_view.dart';
import 'package:mgcs_app/ui/views/startup/startup_view.dart';
import 'package:mgcs_app/ui/views/track/track_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, path: '/', initial: true),
    MaterialRoute(page: IntroView, path: '/intro'),
    MaterialRoute(page: ExpertiseLevelView, path: '/expertise-level'),
    MaterialRoute(page: HomeView, path: '/home'),
    MaterialRoute(page: PracticeView, path: '/practice'),
    MaterialRoute(page: TrackView, path: '/track'),
    MaterialRoute(page: SettingsView, path: '/settings'),
    MaterialRoute(page: ProfileView, path: '/profile'),
    MaterialRoute(page: LoginView, path: '/login'),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    Singleton(classType: AuthenticationService),
  ],
  logger: StackedLogger(),
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
