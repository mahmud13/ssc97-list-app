import 'package:localstorage/localstorage.dart';
import 'package:mgcs_app/app/app.logger.dart';
import 'package:mgcs_app/app/http_client.dart';
import 'package:mgcs_app/models/auth/login_response.dart';
import 'package:mgcs_app/models/user/user.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';
import 'package:dio/dio.dart';

class AuthenticationService with ReactiveServiceMixin {
  final log = getLogger('AuthenticationService');
  final _localStorage = LocalStorage('mgcs_app');
  final dio = getDio();

  AuthenticationService() {
    listenToReactiveValues([_token]);
  }

  /// @return [String] token
  final RxValue<String> _token = RxValue<String>("");
  String get token => _token.value;
  bool get loggedIn => _token.value.isNotEmpty ? true : false;

  /// @return [User] user
  final RxValue<User?> _user = RxValue<User?>(null);
  User? get user => _user.value;

  static const authTokenKey = 'auth.token';

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
          "client_id": 1,
          "client_secret": "",
          "firebase_token": firebaseToken,
          "firebase_uid": firebaseUid,
        },
      );

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

      User data = User.fromJson(response.data);
      _user.value = data;
    } on DioError catch (e) {
      handleError(e);
    }
  }

  /// Logs out the user.
  ///
  /// @return void
  Future logout() async {
    try {
      await dio.get(
        '/api/auth/logout',
        options: authorizationHeader,
      );

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
    var localStorage = LocalStorage('mgcs_app');
    _token.value = token;
    localStorage.setItem(authTokenKey, token);
  }

  /// Destroy the auth token from state and in [SharedPreferences]
  ///
  /// @return void
  void deleteToken() async {
    var localStorage = LocalStorage('mgcs_app');
    _token.value = "";
    localStorage.deleteItem(authTokenKey);
  }

  /// A callback function receiving [DioError] as first parameter
  /// then handles the error based on status code given from response.
  ///
  /// @return void
  void handleError(DioError error) {
    if (error.response == null) {
      return;
    }
    switch (error.response!.statusCode) {
      case 403:
        print("You do not have the right privileges to access this resource.");
        break;
      case 422:
        print("The data you have provided is invalid.");
        break;
      case 401:
        print("Incorrect credentials.");
        break;
      case 404:
        print("Request not found.");
        break;
      case 500:
        print(
            "There is something wrong with our servers, please report to the admin so it gets fixed.");
        break;
      default:
        print("Something went wrong.");
    }
  }
}
