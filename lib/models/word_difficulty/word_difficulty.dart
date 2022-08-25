import 'package:freezed_annotation/freezed_annotation.dart';
part 'word_difficulty.freezed.dart';
part 'word_difficulty.g.dart';

@freezed
class WordDifficulty with _$WordDifficulty {
  WordDifficulty._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  factory WordDifficulty({
    required int id,
    required String name,
    required int sequence,
  }) = _WordDifficulty;

  factory WordDifficulty.fromJson(Map<String, dynamic> json) => _$WordDifficultyFromJson(json);
}
