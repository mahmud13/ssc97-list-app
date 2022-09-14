// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WordDifficulty _$$_WordDifficultyFromJson(Map<String, dynamic> json) =>
    _$_WordDifficulty(
      id: json['id'] as int,
      name: json['name'] as String,
      sequence: json['sequence'] as int,
    );

Map<String, dynamic> _$$_WordDifficultyToJson(_$_WordDifficulty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sequence': instance.sequence,
    };

_$_WordCategory _$$_WordCategoryFromJson(Map<String, dynamic> json) =>
    _$_WordCategory(
      id: json['id'] as int,
      name: json['name'] as String,
      sequence: json['sequence'] as int,
    );

Map<String, dynamic> _$$_WordCategoryToJson(_$_WordCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sequence': instance.sequence,
    };

_$_Word _$$_WordFromJson(Map<String, dynamic> json) => _$_Word(
      id: json['id'] as int,
      word: json['word'] as String,
      transliteration: json['transliteration'] as String,
      audio: json['audio'] as String,
      picture: json['picture'] as String,
      sequence: json['sequence'] as int,
      isLiked: json['is_liked'] as bool,
    );

Map<String, dynamic> _$$_WordToJson(_$_Word instance) => <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'transliteration': instance.transliteration,
      'audio': instance.audio,
      'picture': instance.picture,
      'sequence': instance.sequence,
      'is_liked': instance.isLiked,
    };
