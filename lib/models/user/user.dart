import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

String _durationFromMilliseconds(dynamic milliseconds) =>
    milliseconds is String ? milliseconds : milliseconds.toString();

@freezed
class User with _$User {
  User._();

  @JsonSerializable()
  factory User({
    required int pNumber,
    required String name,
    @JsonKey(name: 'phone', fromJson: _durationFromMilliseconds)
        required String phone,
    String? email,
    String? bloodGroup,
    String? location,
    int? slot,
    String? sms,
    String? pCard,
    String? nrb,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
