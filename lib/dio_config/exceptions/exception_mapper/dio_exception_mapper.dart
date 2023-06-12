import 'dart:io';
import 'package:dio/dio.dart';
import '../../../base/base_mapper/base_error_response_mapper.dart';
import '../../../base/base_mapper/base_exception_mapper.dart';
import '../remote/remote_exceptions.dart';
import '../remote/server_errors.dart';

class DioExceptionMapper extends ExceptionMapper<RemoteException> {
  DioExceptionMapper(this._errorResponseMapper);

  final BaseErrorResponseMapper _errorResponseMapper;

  @override
  RemoteException map(Object? exception) {
    if (exception is DioError) {
      switch (exception.type) {
        case DioErrorType.cancel:
          return const RemoteException(kind: RemoteExceptionKind.cancellation);
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return RemoteException(
            kind: RemoteExceptionKind.timeout,
            rootException: exception,
          );
        case DioErrorType.connectionTimeout:
        case DioErrorType.badCertificate:
          return RemoteException(
            kind: RemoteExceptionKind.serverUndefined,
            rootException: exception,
          );
        case DioErrorType.badResponse:
          final httpErrorCode = exception.response?.statusCode ?? -1;

          /// server-defined error
          if (exception.response?.data != null) {
            final serverError = exception.response!.data! is Map
                ? _errorResponseMapper.mapToEntity(exception.response!.data!)
                : ServerError(message: exception.response!.data!);

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

        case DioErrorType.connectionError:
          if (exception.error is SocketException) {
            return RemoteException(
              kind: RemoteExceptionKind.network,
              rootException: exception.error,
            );
          }
          break;
        case DioErrorType.unknown:
          break;
      }
    }
    return RemoteException(
      kind: RemoteExceptionKind.unknown,
      rootException: exception,
    );
  }
}
