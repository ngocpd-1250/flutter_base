import 'package:dio/dio.dart';

import 'package:base_flutter/data/data_sources/remote/api/settings/export.dart';

class DioBuilder {
  const DioBuilder._();

  static Dio createDio({
    BaseOptions? options,
  }) {
    return Dio(
      BaseOptions(
        connectTimeout: options?.connectTimeout ??
            ServerTimeoutConstants.connectTimeoutInMs,
        receiveTimeout: options?.receiveTimeout ??
            ServerTimeoutConstants.receiveTimeoutInMs,
        sendTimeout: ServerTimeoutConstants.sendTimeoutInMs,
        baseUrl: options?.baseUrl ?? '',
      ),
    );
  }
}
