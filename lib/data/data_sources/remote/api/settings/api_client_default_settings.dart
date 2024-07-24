import 'package:dio/dio.dart';

class ApiClientDefaultSetting {
  const ApiClientDefaultSetting._();

  static List<Interceptor> requiredInterceptors(Dio dio) => [];
}
