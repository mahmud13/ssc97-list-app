import 'package:dio/dio.dart';
import 'package:mgcs_app/app/app.locator.dart';
import 'package:mgcs_app/app/app.logger.dart';
import 'package:mgcs_app/app/app.router.dart';
import 'package:mgcs_app/app/http_client.dart';
import 'package:mgcs_app/models/api_helpers/api_wrapper.dart';
import 'package:mgcs_app/models/word_difficulty/word_difficulty.dart';
import 'package:mgcs_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ExpertiseLevelViewModel extends FutureViewModel {
  final log = getLogger('ExpertiseLevelViewModel');
  final dio = getDio();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  List<WordDifficulty> difficulties = [];
  double _selectedDifficulty = 0;

  double get selectedDifficulty => _selectedDifficulty;

  set selectedDifficulty(value) {
    _selectedDifficulty = value;
    notifyListeners();
  }

  String get label => difficulties[selectedDifficulty.round()].name;

  void goHome() async {
    await _authService
        .setWordDifficulty(difficulties[selectedDifficulty.round()]);
    _navigationService.replaceWith(Routes.homeView);
  }

  Future fetchDifficulties() async {
    try {
      var response = await dio.get('/word-difficulties');
      var result =
          ApiResult.fromResponseAsList(response, WordDifficulty.fromJson);
      if (result is Success<List<WordDifficulty>>) {
        difficulties = result.data;
        selectedDifficulty = difficulties.first;
      }
    } on DioError catch (e) {
      log.e(e.response ?? e.message);
      difficulties = [];
      rethrow;
    } on Error catch(e) {
      log.e(e);
      rethrow;
    }
  }

  @override
  Future futureToRun() async {
    await fetchDifficulties();
  }
}
