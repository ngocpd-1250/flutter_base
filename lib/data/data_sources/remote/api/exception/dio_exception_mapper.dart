import 'package:dio/dio.dart';

import 'package:base_flutter/data/data_sources/remote/api/exception/export.dart';
import 'package:base_flutter/data/data_sources/remote/api/mapper/export.dart';
import 'package:base_flutter/data/models/base/export.dart';

class DioExceptionMapper extends ExceptionMapper<RemoteException> {
  DioExceptionMapper(this._errorResponseMapper);

  final BaseErrorResponseMapper _errorResponseMapper;

  @override
  RemoteException map(Object? exception) {
    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.cancel:
          return const RemoteException(kind: RemoteExceptionKind.cancellation);
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return RemoteException(
            kind: RemoteExceptionKind.timeout,
            rootException: exception,
          );
        case DioExceptionType.unknown:
          final httpErrorCode = exception.response?.statusCode ?? -1;

          /// server-defined error
          if (exception.response?.data != null) {
            final serverError = exception.response!.data! is Map
                ? _errorResponseMapper.mapToEntity(exception.response!.data!)
                : ServerError(generalMessage: exception.response!.data!);

            return RemoteException(
              kind: RemoteExceptionKind.serverDefined,
              httpErrorCode: httpErrorCode,
              serverError: serverError,
            );
          }

          return RemoteException(
            kind: RemoteExceptionKind.serverUndefined,
            httpErrorCode: httpErrorCode,
            rootException: exception,
          );
        case DioExceptionType.badCertificate:
        case DioExceptionType.badResponse:
        case DioExceptionType.connectionError:
          return RemoteException(
            kind: RemoteExceptionKind.serverDefined,
            rootException: exception,
          );
      }
    }

    return RemoteException(
        kind: RemoteExceptionKind.unknown, rootException: exception);
  }
}
