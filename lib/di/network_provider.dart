import 'package:flutter/foundation.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:base_flutter/data/remote/api/auth_api.dart';
import 'package:base_flutter/data/remote/api/none_auth_api.dart';
import 'package:base_flutter/data/remote/builder/dio_builder.dart';
import 'package:base_flutter/data/remote/middlewares/auth_interceptor.dart';
import 'package:base_flutter/data/remote/middlewares/common_interceptor.dart';
import 'package:base_flutter/di/local_provider.dart';

part 'network_provider.g.dart';

@Riverpod(keepAlive: true)
CommonInterceptor commonInterceptor(CommonInterceptorRef ref) {
  return CommonInterceptor();
}

@Riverpod(keepAlive: true)
PrettyDioLogger loggerInterceptor(LoggerInterceptorRef ref) {
  return PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  );
}

@Riverpod(keepAlive: true)
DioBuilder noneAuthDioBuilder(NoneAuthDioBuilderRef ref) {
  return DioBuilder.getInstance(
    interceptors: [
      ref.watch(commonInterceptorProvider),
      if (kDebugMode) ref.watch(loggerInterceptorProvider),
    ],
  );
}

@Riverpod(keepAlive: true)
NoneAuthApi noneAuthApi(NoneAuthApiRef ref) {
  return NoneAuthApi(
    ref.watch(noneAuthDioBuilderProvider),
  );
}

@Riverpod(keepAlive: true)
AuthInterceptor authInterceptor(AuthInterceptorRef ref) {
  return AuthInterceptor(
    currentDio: ref.watch(noneAuthDioBuilderProvider),
    secureStorage: ref.watch(secureStorageProvider),
    noneAuthApi: ref.watch(noneAuthApiProvider),
  );
}

@Riverpod(keepAlive: true)
DioBuilder authDioBuilder(AuthDioBuilderRef ref) {
  return DioBuilder.getInstance(
    interceptors: [
      ref.watch(commonInterceptorProvider),
      ref.watch(authInterceptorProvider),
      if (kDebugMode) ref.watch(loggerInterceptorProvider),
    ],
  );
}

@Riverpod(keepAlive: true)
AuthApi authApi(AuthApiRef ref) {
  return AuthApi(
    ref.watch(authDioBuilderProvider),
  );
}
