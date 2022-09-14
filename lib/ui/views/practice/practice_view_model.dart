import 'dart:io';
import 'dart:math';

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
  List<WordDifficulty> wordDifficulties = [];
  List<WordCategory> wordCategories = [];
  int? currentWordIndex;
  int? currentWordDifficultiesIndex;
  int? currentWordCategoriesIndex;
  int page = Random().nextInt(30);

  WordDifficulty? selectedWordDifficulty;
  WordCategory? selectedWordCategory;

  Word? get currentWord =>
      currentWordIndex != null ? words[currentWordIndex!] : null;

  Answer? currentAnswer;
  File? currentRecording;

  PracticeViewModel() {
    log.i('initiated');
  }

  int get wordDifficultyIndex {
    return wordDifficulties.indexOf(selectedWordDifficulty != null
        ? selectedWordDifficulty!
        : wordDifficulties[0]);
  }

  int get wordCateroryIndex {
    return wordCategories.indexOf(selectedWordCategory != null
        ? selectedWordCategory!
        : wordCategories[0]);
  }

  void onSelectedWordDifficulty(WordDifficulty? item) {
    selectedWordDifficulty = item;
    notifyListeners();
  }

  void onSelectedWordCategory(WordCategory? item) {
    selectedWordCategory = item;
    notifyListeners();
  }

  Future fetchWords() async {
    try {
      var response = await dio.get('/words', queryParameters: {'page': page});
      var result = ApiResult.fromResponseAsList(response, Word.fromJson);
      if (result is Success<List<Word>>) {
        words = words.isEmpty ? result.data : [...words, ...result.data];
        if (words.isNotEmpty) {
          currentWordIndex ??= 0;
        }
      }
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  Future fetchWordDifficulties() async {
    try {
      var response = await dio.get('/word-difficulties');
      var result =
          ApiResult.fromResponseAsList(response, WordDifficulty.fromJson);
      if (result is Success<List<WordDifficulty>>) {
        wordDifficulties = result.data;
        if (wordDifficulties.isNotEmpty) {
          currentWordDifficultiesIndex = 0;
        }
      }
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  Future fetchWordCategories() async {
    try {
      var response = await dio.get('/word-categories');
      var result =
          ApiResult.fromResponseAsList(response, WordCategory.fromJson);
      if (result is Success<List<WordCategory>>) {
        wordCategories = result.data;
        if (wordCategories.isNotEmpty) {
          currentWordCategoriesIndex = 0;
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

  Future next() async {
    if (currentWordIndex != null && currentWordIndex == words.length - 1) {
      page++;
      await fetchWords();
    }
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
    await fetchWordDifficulties();
    await fetchWordCategories();
  }
}
