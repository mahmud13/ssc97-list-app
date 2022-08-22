import 'package:mgcs_app/app/app.logger.dart';
import 'package:mgcs_app/app/http_client.dart';
import 'package:mgcs_app/app/localstorage.dart';
import 'package:mgcs_app/models/api_helpers/api_wrapper.dart';
import 'package:mgcs_app/models/auth/login_response.dart';
import 'package:mgcs_app/models/user/user.dart';
import 'package:stacked/stacked.dart';
import 'package:dio/dio.dart';

class AuthenticationService with ReactiveServiceMixin {
  final log = getLogger('AuthenticationService');
  final dio = getDio();

  AuthenticationService() {
    listenToReactiveValues([_token]);
  }

  /// @return [String] token
  final ReactiveValue<String> _token = ReactiveValue<String>("");
  String get token => _token.value;
  bool get loggedIn => _token.value.isNotEmpty ? true : false;

  /// @return [User] user
  final ReactiveValue<User?> _user = ReactiveValue<User?>(null);
  User? get user => _user.value;

  static const authTokenKey = 'auth.token';

  Future initializeAuth() async {
    try {
      var localstorage = await getLocalStorage();
      var token = localstorage.getString(AuthenticationService.authTokenKey);
      if (token != null) {
        setToken(token);
        await fetchUser();
      }

      log.i('Logged in');
    } on DioError catch (e) {
      handleError(e);
    }
  }

  /// Login with email and password.
  ///
  /// @param [EmailCredential] credentials A map containing email and password
  /// @return void
  Future loginWithFirebase({
    required String firebaseToken,
    required String firebaseUid,
  }) async {
    try {
      log.i('Logging in...');

      Response response = await dio.post(
        '/login',
        data: {
          "grant_type": "firebase",
          "client_id": 1,
          "client_secret": "cOqxgG077cQ2F8zvWD8ndYxGJ4TIdZ7IF9kLlCjh",
          "firebase_token": firebaseToken,
          "firebase_uid": firebaseUid,
        },
      );
      log.i("login Response");
      log.i(response.data);
      LoginResponse data = LoginResponse.fromJson(response.data);
      _token.value = data.accessToken;
      setToken(data.accessToken);
      await fetchUser();

      log.i('Logged in');

      return response;
    } on DioError catch (e) {
      handleError(e);
    }
  }

  /// Fetch the current authenticated user.
  ///
  /// @return void
  Future fetchUser() async {
    try {
      Response response = await dio.get(
        '/me',
        options: authorizationHeader,
      );
      var result = ApiResult.fromResponse(response, User.fromJson);
      if (result is Success<User>) {
        _user.value = result.data;
      }
    } on DioError catch (e) {
      handleError(e);
    }
  }

  /// Logs out the user.
  ///
  /// @return void
  Future logout() async {
    try {
      deleteToken();
      _user.value = null;
    } on DioError catch (e) {
      handleError(e);
    }
  }

  /// Use the authorization header with Bearer token.
  ///
  /// @return [Options]
  Options get authorizationHeader {
    return Options(
      headers: {
        "Authorization": "Bearer ${_token.value}",
        "accept": "application/json",
      },
    );
  }

  /// Sets the authentication token in the state and also locally
  /// using [SharedPreferences]
  ///
  /// @param string [token]
  /// @return void
  void setToken(String token) async {
    _token.value = token;
    var localstorage = await getLocalStorage();
    localstorage.setString(authTokenKey, token);
  }

  /// Destroy the auth token from state and in [SharedPreferences]
  ///
  /// @return void
  void deleteToken() async {
    _token.value = "";
    var localstorage = await getLocalStorage();
    localstorage.remove(authTokenKey);
  }

  /// A callback function receiving [DioError] as first parameter
  /// then handles the error based on status code given from response.
  ///
  /// @return void
  void handleError(DioError error) {
    deleteToken();
    if (error.response == null) {
      return;
    }
    log.e(error.response);
    switch (error.response!.statusCode) {
      case 403:
        log.e("You do not have the right privileges to access this resource.");
        break;
      case 422:
        log.e("The data you have provided is invalid.");
        break;
      case 401:
        log.e("Incorrect credentials.");
        break;
      case 404:
        log.e("Request not found.");
        break;
      case 500:
        log.e(
            "There is something wrong with our servers, please report to the admin so it gets fixed.");
        break;
      default:
        log.e("Something went wrong.");
    }
  }

  Future setExpertiseLevel(String level) async {
    try {
      log.i('updating user...');

      Response response = await dio.patch(
        '/me',
        data: {
          "expertise_level": level,
        },
      );
      log.i("Update Response");
      var result = ApiResult.fromResponse(response, User.fromJson);
      if (result is Success<User>) {
        _user.value = result.data;
      }

      return response;
    } on DioError catch (e) {
      handleError(e);
    }
  }
}
