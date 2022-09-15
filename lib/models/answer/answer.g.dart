// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LetterAccuracy _$$_LetterAccuracyFromJson(Map<String, dynamic> json) =>
    _$_LetterAccuracy(
      letter: json['letter'] as String,
      colorCode: json['colorCode'] as int,
    );

Map<String, dynamic> _$$_LetterAccuracyToJson(_$_LetterAccuracy instance) =>
    <String, dynamic>{
      'letter': instance.letter,
      'colorCode': instance.colorCode,
    };

_$_WordFeedback _$$_WordFeedbackFromJson(Map<String, dynamic> json) =>
    _$_WordFeedback(
      arabic: json['arabic'] as String,
      transliteration: (json['transliteration'] as List<dynamic>)
          .map((e) => LetterAccuracy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WordFeedbackToJson(_$_WordFeedback instance) =>
    <String, dynamic>{
      'arabic': instance.arabic,
      'transliteration': instance.transliteration,
    };

_$_Answer _$$_AnswerFromJson(Map<String, dynamic> json) => _$_Answer(
      id: json['id'] as int,
      accuracy: (json['accuracy'] as num).toDouble(),
      feedback: WordFeedback.fromJson(json['feedback'] as Map<String, dynamic>),
      wordId: json['word_id'] as int,
    );

Map<String, dynamic> _$$_AnswerToJson(_$_Answer instance) => <String, dynamic>{
      'id': instance.id,
      'accuracy': instance.accuracy,
      'feedback': instance.feedback,
      'word_id': instance.wordId,
    };
