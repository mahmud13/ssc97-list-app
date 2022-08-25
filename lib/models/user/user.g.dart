// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      email: json['email'] as String?,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      wordDifficulty: json['word_difficulty'] == null
          ? null
          : WordDifficulty.fromJson(
              json['word_difficulty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'word_difficulty': instance.wordDifficulty,
    };
