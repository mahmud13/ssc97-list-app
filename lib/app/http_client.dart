import 'dart:io';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:mgcs_app/app/localstorage.dart';
import 'package:mgcs_app/config.dart' as config;
import 'package:mgcs_app/services/authentication_service.dart';

Dio getDio() {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: config.apiUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {HttpHeaders.acceptHeader: 'application/json'},
    ),
  );
  dio.interceptors.addAll([
    // Append authorization
    InterceptorsWrapper(onRequest: (options, handler) async {
      var localStorage = await getLocalStorage();
      var token = localStorage.getString(AuthenticationService.authTokenKey);
      if (token != null) {
        options.headers
            .addAll({HttpHeaders.authorizationHeader: "Bearer $token"});
      }
      return handler.next(options);
    })
  ]);
  dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));

  return dio;
}
