import 'package:mgcs_app/app/http_client.dart';
import 'package:mgcs_app/models/api_helpers/api_wrapper.dart';
import 'package:mgcs_app/models/words/word.dart';
import 'package:stacked/stacked.dart';
import 'package:mgcs_app/app/app.logger.dart';

class PracticeViewModel extends FutureViewModel {
  final log = getLogger('PracticeViewModel');
  final dio = getDio();
  List<Word> words = [];
  Word? currentWord;

  PracticeViewModel() {
    log.i('initiated');
  }

  Future fetchWords() async {
    try {
      var response = await dio.get('/words');
      var result = ApiResult.fromResponseAsList(response, Word.fromJson);
      if (result is Success<List<Word>>) {
        words = result.data;
        if(words.isNotEmpty) {
          currentWord = words.first;
        }
      }
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  @override
  Future futureToRun() async {
    await fetchWords();
  }
}
