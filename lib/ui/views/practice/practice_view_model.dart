import 'dart:io';

import 'package:mgcs_app/app/app.locator.dart';
import 'package:mgcs_app/app/http_client.dart';
import 'package:mgcs_app/models/api_helpers/api_wrapper.dart';
import 'package:mgcs_app/models/words/word.dart';
import 'package:stacked/stacked.dart';
import 'package:mgcs_app/app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

class PracticeViewModel extends FutureViewModel {
  final log = getLogger('PracticeViewModel');
  final _navigationService = locator<NavigationService>();

  bool showFeedback = false;

  final dio = getDio();
  List<Word> words = [];
  Word? currentWord;
  File? currentRecording;

  PracticeViewModel() {
    log.i('initiated');
  }

  Future fetchWords() async {
    try {
      var response = await dio.get('/words');
      var result = ApiResult.fromResponseAsList(response, Word.fromJson);
      if (result is Success<List<Word>>) {
        words = result.data;
        if (words.isNotEmpty) {
          currentWord = words.first;
        }
      }
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  void showAnswer() {
    print(currentRecording);
    setBusy(true);
    showFeedback = true;
    setBusy(false);
    // _navigationService.navigateTo(Routes.homeView);
  }

  @override
  Future futureToRun() async {
    await fetchWords();
  }
}
