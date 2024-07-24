import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:base_flutter/data/data_sources/remote/api/interceptor/export.dart';
import 'package:base_flutter/data/data_sources/shared_preference/app_shared_preference.dart';

@Injectable()
class AuthTokenInterceptor extends BaseInterceptor {
  AuthTokenInterceptor({
    required this.appPreferences,
  });

  final AppPreferences appPreferences;

  @override
  int get priority => BaseInterceptor.basicAuthPriority;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await appPreferences.accessToken;
    options.headers['X-Auth-Token'] = 'Bearer $accessToken';

    super.onRequest(options, handler);
  }
}
