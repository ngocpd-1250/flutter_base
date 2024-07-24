import 'package:dio/dio.dart';

abstract class BaseInterceptor extends InterceptorsWrapper {
  static const customLogPriority = 1;
  static const headerPriority = 19;
  static const accessTokenPriority = 20;
  static const refreshTokenPriority = 30;
  static const basicAuthPriority = 40;
  static const connectivityPriority = 99;
  static const retryOnErrorPriority = 100;

  int get priority;
}
