import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:base_flutter/shared/env/app_env.dart';

class DioBuilder extends DioMixin implements Dio {
  final int connectionTimeOutMls = 30000;
  final int readTimeOutMls = 30000;
  final int writeTimeOutMls = 30000;

  static DioBuilder getInstance(
      {List<Interceptor>? interceptors, BaseOptions? options}) {
    return DioBuilder._(interceptors, options);
  }

  DioBuilder._(List<Interceptor>? interceptors, [BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: AppEnv().baseURL,
      connectTimeout: Duration(milliseconds: connectionTimeOutMls),
      receiveTimeout: Duration(milliseconds: readTimeOutMls),
      sendTimeout: Duration(milliseconds: writeTimeOutMls),
    );
    this.options = options;

    if (interceptors != null && interceptors.isNotEmpty) {
      this.interceptors.addAll(interceptors);
    }

    httpClientAdapter = IOHttpClientAdapter();
  }
}
