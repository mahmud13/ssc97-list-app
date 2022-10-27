// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      pNumber: json['pNumber'] as int,
      name: json['name'] as String,
      phone: _durationFromMilliseconds(json['phone']),
      email: json['email'] as String?,
      bloodGroup: json['bloodGroup'] as String?,
      location: json['location'] as String?,
      slot: json['slot'] as int?,
      sms: json['sms'] as String?,
      pCard: json['pCard'] as String?,
      nrb: json['nrb'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'pNumber': instance.pNumber,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'bloodGroup': instance.bloodGroup,
      'location': instance.location,
      'slot': instance.slot,
      'sms': instance.sms,
      'pCard': instance.pCard,
      'nrb': instance.nrb,
    };
