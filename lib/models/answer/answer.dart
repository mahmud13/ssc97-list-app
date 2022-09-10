import 'package:freezed_annotation/freezed_annotation.dart';
part 'answer.freezed.dart';
part 'answer.g.dart';

@freezed
class LetterAccuracy with _$LetterAccuracy {
  LetterAccuracy._();
  factory LetterAccuracy({
    required String letter,
    required int colorCode,
  }) = _LetterAccuracy;
  factory LetterAccuracy.fromJson(Map<String, dynamic> json) =>
      _$LetterAccuracyFromJson(json);
}

@freezed
class WordFeedback with _$WordFeedback {
  WordFeedback._();

  factory WordFeedback({
    required List<LetterAccuracy> arabic,
    required List<LetterAccuracy> transliteration,
  }) = _WordFeedback;
  factory WordFeedback.fromJson(Map<String, dynamic> json) =>
      _$WordFeedbackFromJson(json);
}

@freezed
class Answer with _$Answer {
  Answer._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Answer({
    required int id,
    required double accuracy,
    required WordFeedback feedback,
    required int wordId,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
