import 'package:flutter/foundation.dart';

import 'package:injectable/injectable.dart';

import 'package:base_flutter/data/data_sources/remote/api/client/export.dart';
import 'package:base_flutter/data/data_sources/remote/api/interceptor/export.dart';
import 'package:base_flutter/shared/env/app_env.dart';

@LazySingleton()
class AuthApiClient extends RestApiClient {
  AuthApiClient(
    HeaderInterceptor headerInterceptor,
    AuthTokenInterceptor tokenInterceptor,
  ) : super(baseUrl: AppEnv().baseURL, interceptors: [
          headerInterceptor,
          tokenInterceptor,
          if (kDebugMode) PrettyLogInterceptor(),
        ]);
}
