import 'package:base_flutter/data/data_sources/remote/api/exception/export.dart';
import 'package:base_flutter/data/models/base/export.dart';

class RemoteException extends AppException {
  const RemoteException({
    required this.kind,
    this.httpErrorCode,
    this.serverError,
    this.rootException,
  }) : super(AppExceptionType.remote);

  final RemoteExceptionKind kind;
  final int? httpErrorCode;
  final ServerError? serverError;
  final Object? rootException;

  int get generalServerStatusCode =>
      serverError?.generalServerStatusCode ??
      serverError?.errors.first.serverStatusCode ??
      -1;

  String? get generalServerErrorId =>
      serverError?.generalServerErrorId ??
      serverError?.errors.first.serverErrorId;

  String? get generalServerMessage =>
      serverError?.generalMessage ?? serverError?.errors.first.message;

  @override
  String toString() {
    return '''RemoteException: {
      kind: $kind
      httpErrorCode: $httpErrorCode,
      serverError: $serverError,
      rootException: $rootException,
      generalServerMessage: $generalServerMessage,
      generalServerErrorCode: $generalServerStatusCode,
      generalServerErrorId: $generalServerErrorId,
      stackTrace: ${rootException is Error ? (rootException as Error).stackTrace : ''}
}''';
  }
}

enum RemoteExceptionKind {
  noInternet,

  /// host not found, cannot connect to host
  network,

  /// server has defined response
  serverDefined,

  /// server has not defined response
  serverUndefined,

  refreshTokenFailed,
  timeout,
  cancellation,
  unknown,
}
