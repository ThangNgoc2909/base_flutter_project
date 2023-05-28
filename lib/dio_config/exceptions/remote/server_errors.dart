import 'package:base_project/dio_config/exceptions/remote/server_error_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_errors.freezed.dart';


@freezed
class ServerError with _$ServerError {
  const factory ServerError({
    /// server-defined status code
    int? statusCode,

    /// server-defined error id
    int? errorId,

    /// server-defined message
    String? message,
    @Default(<ServerErrorDetail>[]) List<ServerErrorDetail> errors,
  }) = _ServerError;
}