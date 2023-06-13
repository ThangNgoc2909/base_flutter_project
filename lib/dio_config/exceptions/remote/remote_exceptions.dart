import 'package:base_project/dio_config/exceptions/remote/server_errors.dart';

import '../../../base/app_exception.dart';

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

  int? get statusCode => serverError?.statusCode;

  int? get errorId => serverError?.errorId ?? -1;

  String? get generalServerMessage => serverError?.message ?? '';

  @override
  String toString() {
    return '''RemoteException: {
      kind: $kind
      httpErrorCode: $httpErrorCode,
      serverError: $serverError,
      rootException: $rootException,
      generalServerMessage: $generalServerMessage,
      generalServerErrorCode: $statusCode,
      errorId: $errorId,
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
