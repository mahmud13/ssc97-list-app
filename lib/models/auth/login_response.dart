import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  LoginResponse._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  factory LoginResponse({
    required String accessToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
