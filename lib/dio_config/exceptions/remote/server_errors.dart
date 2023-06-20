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
  }) = _ServerError;
}
