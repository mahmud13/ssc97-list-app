import 'package:freezed_annotation/freezed_annotation.dart';
part 'word_answer.freezed.dart';
part 'word_answer.g.dart';

@freezed
class WordAnswer with _$WordAnswer {
  WordAnswer._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  factory WordAnswer({
    required int id,
    required String name,
    required int sequence,
  }) = _WordAnswer;

  factory WordAnswer.fromJson(Map<String, dynamic> json) =>
      _$WordAnswerFromJson(json);
}
