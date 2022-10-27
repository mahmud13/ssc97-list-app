
import 'package:ssc_97/app/app.locator.dart';
import 'package:ssc_97/app/app.router.dart';
import 'package:ssc_97/models/user/user.dart';
import 'package:ssc_97/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:ssc_97/app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel {
  final log = getLogger('Home');
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  User? currentUser;
  List<User> get allUsers => _authService.allUsers;
  bool get dataLoading => _authService.dataLoading;
  List<User> filteredUsers = [];

  HomeViewModel() {
    log.i('initiated');
  }
  void goToPracticeView() {
    _navigationService.navigateTo(Routes.practiceView);
  }

  @override
  Future futureToRun() async {
    // var response = await rootBundle.loadString('assets/members.json');
    // List<dynamic> responseJson = json.decode(response);
    await getDataFromGoogleSheet();
  }

  filter(String? filter) {
    if (filter == null || filter == "") {
      filteredUsers = [];
    } else {
      filteredUsers = allUsers
          .where((element) => element.pNumber.toString().startsWith(filter))
          .toList();
    }
    return true;
  }

  void setMember(User? value) {
    currentUser = value;
    notifyListeners();
  }

  Future<void> getDataFromGoogleSheet() async {
    setBusy(true);
    await _authService.getDataFromGoogleSheet();
    filteredUsers = [];
    setBusy(false);
  }
}
