import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:base_flutter/data/data_sources/remote/api/interceptor/export.dart';

@Injectable()
class HeaderInterceptor extends BaseInterceptor {
  @override
  int get priority => BaseInterceptor.headerPriority;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json; charset=utf-8';
    handler.next(options);
  }
}
