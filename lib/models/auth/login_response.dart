import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class LoginResponse with _$LoginResponse {
  LoginResponse._();

  factory LoginResponse({
    required String accessToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
