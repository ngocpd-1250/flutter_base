import 'package:dio/dio.dart';

class CommonInterceptor extends InterceptorsWrapper {
  final String userAgentKey = 'User-Agent';
  final String contentType = 'contentType';
  final String accept = 'Accept';
  final String acceptValue = 'application/json';

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[accept] = acceptValue;
    options.headers[contentType] = acceptValue;
    handler.next(options);
  }
}
