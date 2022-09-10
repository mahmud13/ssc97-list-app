import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mgcs_app/app/app.locator.dart';
import 'package:mgcs_app/app/http_client.dart';
import 'package:mgcs_app/models/answer/answer.dart';
import 'package:mgcs_app/models/api_helpers/api_wrapper.dart';
import 'package:mgcs_app/models/words/word.dart';
import 'package:stacked/stacked.dart';
import 'package:mgcs_app/app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

class PracticeViewModel extends FutureViewModel {
  final log = getLogger('PracticeViewModel');
  final _navigationService = locator<NavigationService>();

  bool isShowingFeedback = false;

  final dio = getDio();
  List<Word> words = [];
  int? currentWordIndex;

  Word? get currentWord =>
      currentWordIndex != null ? words[currentWordIndex!] : null;

  Answer? currentAnswer;
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
          currentWordIndex = 0;
        }
      }
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  Future showFeedback() async {
    if (currentRecording != null) {
      setBusy(true);
      try {
        String fileName = currentRecording!.path.split('/').last;
        FormData formData = FormData.fromMap({
          "word_id": currentWord!.id,
          "audio": await MultipartFile.fromFile(currentRecording!.path,
              filename: fileName),
        });
        Response response = await dio.post(
          '/answers',
          data: formData,
        );

        var result = ApiResult.fromResponse<Answer>(response, Answer.fromJson);
        if (result is Success<Answer>) {
          currentAnswer = result.data;
        }
        isShowingFeedback = true;
        notifyListeners();
      } catch (e) {
        log.e(e);
      } finally {
        setBusy(false);
      }
      // _navigationService.navigateTo(Routes.homeView);
    }
  }

  void replay() {
    currentRecording = null;
    isShowingFeedback = false;
    notifyListeners();
  }

  void next() {
    if (currentWordIndex != null && currentWordIndex! < words.length - 1) {
      currentWordIndex = currentWordIndex! + 1;
    }
    currentRecording = null;
    isShowingFeedback = false;
    notifyListeners();
  }

  void prev() {
    if (currentWordIndex != null && currentWordIndex! > 0) {
      currentWordIndex = currentWordIndex! - 1;
    }
    currentRecording = null;
    isShowingFeedback = false;
    notifyListeners();
  }

  @override
  Future futureToRun() async {
    await fetchWords();
  }
}
