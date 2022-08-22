import 'package:mgcs_app/app/app.locator.dart';
import 'package:mgcs_app/app/app.router.dart';
import 'package:mgcs_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ExpertiseLevelViewModel extends BaseViewModel {
  final expertises = ['Beginner', 'Intermediate', 'Expert'];
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  double _selectedExpertise = 0;

  double get selectedExpertise => _selectedExpertise;

  set selectedExpertise(value) {
    _selectedExpertise = value;
    notifyListeners();
  }

  String get label => expertises[_selectedExpertise.round()];
  void goHome() async {
    await _authService.setExpertiseLevel(label);
    _navigationService.replaceWith(Routes.homeView);
  }
}
