import 'package:dio/dio.dart';

import 'package:base_flutter/data/app_error.dart';
import 'package:base_flutter/data/local/storage/secure_storage.dart';
import 'package:base_flutter/data/local/storage/storage_keys.dart';
import 'package:base_flutter/data/model/auth_token.dart';
import 'package:base_flutter/data/remote/api/none_auth_api.dart';
import 'package:base_flutter/data/remote/requests/refresh_token_request.dart';

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor(
      {required this.currentDio,
      required this.secureStorage,
      required this.noneAuthApi});
  static const int maxRetryAttempts = 3;
  final SecureStorage secureStorage;
  final Dio currentDio;
  final NoneAuthApi noneAuthApi;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = secureStorage.get(StorageKeys.accessToken.name);
    if (accessToken != null) {
      options.headers["Authorization"] = "Bearer $accessToken";
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        await _attemptTokenRefresh();
        final newAccessToken = secureStorage.get(StorageKeys.accessToken.name);
        final RequestOptions requestOptions = err.requestOptions;
        final opts = Options(
          method: requestOptions.method,
          headers: {
            ...requestOptions.headers,
            "Authorization": "Bearer $newAccessToken",
          },
        );
        final Response response = await currentDio.request(
          requestOptions.path,
          options: opts,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
        );

        return handler.resolve(response);
      } catch (e) {
        if (e is AuthenticationException) {
          secureStorage.removeAll();
        }

        return handler.next(err);
      }
    } else {
      return handler.next(err);
    }
  }

  Future<void> _attemptTokenRefresh() async {
    final refreshToken = secureStorage.get(StorageKeys.refreshToken.name);
    if (refreshToken == null) {
      throw AuthenticationException(
        message: "No refresh token available",
      );
    }

    int retryCount = 0;
    while (retryCount < maxRetryAttempts) {
      try {
        final AuthToken token = await noneAuthApi.refreshToken(
          RefreshTokenRequest(refreshToken: refreshToken),
        );

        await secureStorage.set(
            StorageKeys.accessToken.name, token.accessToken);
        await secureStorage.set(
            StorageKeys.refreshToken.name, token.refreshToken ?? '');

        return;
      } catch (e) {
        retryCount++;
        if (retryCount >= maxRetryAttempts) {
          throw AuthenticationException(
            message: "Failed to refresh token after $maxRetryAttempts attempts",
          );
        }
      }
    }
  }
}
