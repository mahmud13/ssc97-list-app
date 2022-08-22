import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  User._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  factory User({
    required int id,
    String? email,
    required String name,
    String? phone,
    String? expertiseLevel,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
