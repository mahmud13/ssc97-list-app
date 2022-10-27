import 'dart:convert';

import 'package:ssc_97/app/app.locator.dart';
import 'package:ssc_97/app/app.logger.dart';
import 'package:ssc_97/app/http_client.dart';
import 'package:ssc_97/app/localstorage.dart';
import 'package:ssc_97/config.dart' as config;
import 'package:ssc_97/models/api_helpers/api_wrapper.dart';
import 'package:ssc_97/models/auth/login_response.dart';
import 'package:ssc_97/models/user/user.dart';
import 'package:ssc_97/models/words/word.dart';
import 'package:stacked/stacked.dart';
import 'package:dio/dio.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthenticationService with ReactiveServiceMixin {
  final log = getLogger('AuthenticationService');
  final _snackbarService = locator<SnackbarService>();
  final dio = getDio();

  AuthenticationService() {
    listenToReactiveValues([_token]);
  }

  /// @return [String] token
  final ReactiveValue<String> _token = ReactiveValue<String>("");
  String get token => _token.value;
  bool get loggedIn => _token.value.isNotEmpty ? true : false;
  final ReactiveValue<List<User>> _allUsers = ReactiveValue<List<User>>([]);
  final ReactiveValue<bool> _loading = ReactiveValue<bool>(false);
  List<User> get allUsers => _allUsers.value;
  bool get dataLoading => _loading.value;

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
    log.i('Logging in...');

    Response response = await dio.post(
      '/login',
      data: {
        "grant_type": "firebase",
        "client_id": 1,
        "client_secret": config.clientSecret,
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
  }

  Future<void> syncDataFromGoogleSheet() async {
    _loading.value = true;
    var dio = Dio();
    var localstorage = await getLocalStorage();
    Response data = await dio.get(
        "https://script.google.com/macros/s/AKfycbzqyolSskfVpJGsKyryuL5856bRZplj5I5xUe053cj2dhu9YVUsX9dEZScTSodPgchP/exec");
    localstorage.setString('members', jsonEncode(data.data));
    var localData = localstorage.getString('members');
    if (localData != null) {
      List<dynamic> localJson = jsonDecode(localData);
      _allUsers.value = localJson.map<User>((e) => User.fromJson(e)).toList();
    }
    _loading.value = false;
  }

  Future<void> getDataFromGoogleSheet() async {
    _loading.value = true;
    var dio = Dio();
    var localstorage = await getLocalStorage();
    var localData = localstorage.getString('members');
    if (localData == null) {
      Response data = await dio.get(
          "https://script.google.com/macros/s/AKfycbzqyolSskfVpJGsKyryuL5856bRZplj5I5xUe053cj2dhu9YVUsX9dEZScTSodPgchP/exec");
      localstorage.setString('members', jsonEncode(data.data));
    }
    localData = localstorage.getString('members');
    if (localData != null) {
      List<dynamic> localJson = jsonDecode(localData);
      _allUsers.value = localJson.map<User>((e) => User.fromJson(e)).toList();
    } else {
      _allUsers.value = [];
    }
    _loading.value = false;
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
      var result = ApiResult.fromResponse<User>(response, User.fromJson);
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
      rethrow;
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
      _snackbarService.showSnackbar(
        title: 'Error',
        message: error.message,
      );
      return;
    }
    log.e(error.response);
    switch (error.response!.statusCode) {
      case 403:
        _snackbarService.showSnackbar(
          title: 'Error',
          message:
              "You do not have the right privileges to access this resource.",
        );
        break;
      case 422:
        _snackbarService.showSnackbar(
          title: 'Error',
          message: "The data you have provided is invalid.",
        );
        break;
      case 401:
        _snackbarService.showSnackbar(
          title: 'Error',
          message: "Incorrect credentials.",
        );
        break;
      case 404:
        _snackbarService.showSnackbar(
          title: 'Error',
          message: "Request not found.",
        );
        break;
      case 500:
        _snackbarService.showSnackbar(
          title: 'Error',
          message:
              "There is something wrong with our servers, please report to the admin so it gets fixed.",
        );
        break;
      default:
        _snackbarService.showSnackbar(
          title: 'Error',
          message: "Something went wrong.",
        );
    }
  }

  Future setWordDifficulty(WordDifficulty difficulty) async {
    try {
      log.i('updating user...');

      Response response = await dio.patch(
        '/me',
        data: {
          "word_difficulty_id": difficulty.id,
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
