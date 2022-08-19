import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class User with _$User {
  User._();

  factory User({
    required String id,
    String? email,
    required String name,
    required String phone,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
