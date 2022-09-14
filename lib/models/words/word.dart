import 'package:freezed_annotation/freezed_annotation.dart';
part 'word.freezed.dart';
part 'word.g.dart';

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

@freezed
class WordCategory with _$WordCategory {
  WordCategory._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  factory WordCategory({
    required int id,
    required String name,
    required int sequence,
  }) = _WordCategory;

  factory WordCategory.fromJson(Map<String, dynamic> json) => _$WordCategoryFromJson(json);
}

@freezed
class Word with _$Word {
  Word._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Word({
    required int id,
    required String word,
    required String transliteration,
    required String audio,
    required String picture,
    required int sequence,
    required bool isLiked,
  }) = _Word;

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);
}
