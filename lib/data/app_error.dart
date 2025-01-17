import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:base_flutter/data/remote/response/error_response.dart';

enum AppErrorType {
  network,
  badRequest,
  unauthorized,
  notFound,
  cancel,
  timeout,
  server,
  firebaseAuth,
  unknown,
}

class AppError {
  final String? message;
  final AppErrorType type;

  final int? errorCode;
  final List<ErrorResponse>? errors;

  AppError(this.type, this.message, {this.errorCode, this.errors});

  factory AppError.from(Object? exception) {
    var type = AppErrorType.unknown;
    String? message = '';
    int? code;
    List<ErrorResponse>? errs;
    if (exception is DioException) {
      message = exception.error.toString();
      code = exception.response?.statusCode ?? -1;

      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          type = AppErrorType.timeout;
          break;
        case DioExceptionType.sendTimeout:
        case DioExceptionType.connectionError:
          type = AppErrorType.network;
          break;
        case DioExceptionType.badResponse:
          switch (exception.response?.statusCode) {
            case HttpStatus.unauthorized:
              type = AppErrorType.unauthorized;
              break;
            case HttpStatus.badRequest:
            case HttpStatus.notFound:
            case HttpStatus.methodNotAllowed:
            case HttpStatus.unprocessableEntity:
            case HttpStatus.internalServerError:
            case HttpStatus.badGateway:
            case HttpStatus.serviceUnavailable:
            case HttpStatus.gatewayTimeout:
              type = AppErrorType.server;
              try {
                final serverErr =
                    ErrorResponse.fromJson(exception.response?.data);
                errs = [serverErr];
              } catch (ex) {
                errs = [ErrorResponse(statusCode: -1, message: ex.toString())];
              }
              break;
            default:
              type = AppErrorType.unknown;
              break;
          }
          break;
        case DioExceptionType.cancel:
          type = AppErrorType.cancel;
          break;

        case DioExceptionType.unknown:
        default:
          if (exception.error is SocketException) {
            type = AppErrorType.network;
          } else {
            type = AppErrorType.unknown;
          }
          break;
      }
    } else if (exception is AuthenticationException) {
      type = AppErrorType.unauthorized;
      code = HttpStatus.unauthorized;
      message = exception.message;
    } else if (exception is FirebaseAuthException) {
      type = AppErrorType.firebaseAuth;
      code = HttpStatus.unauthorized;
      message = exception.message;
    } else {
      code = -1;
      type = AppErrorType.unknown;
      message = 'AppError: $exception';
    }

    return AppError(type, message, errorCode: code, errors: errs);
  }

  @override
  bool operator ==(covariant AppError other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.type == type &&
        other.errorCode == errorCode &&
        listEquals(other.errors, errors);
  }

  @override
  String toString() {
    return 'AppError(message: $message, type: $type, errorCode: $errorCode, errors: $errors)';
  }
}

class AuthenticationException extends Object {
  AuthenticationException({
    required this.message,
  });
  final String message;
}
