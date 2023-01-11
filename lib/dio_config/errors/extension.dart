import 'dart:io';
import 'package:dio/dio.dart';
import 'error_response.dart';

extension DioErrorMessage on DioError {
  String get errorMessage {
    String errorMessage = "something went wrong!";
    switch (type) {
      case DioErrorType.cancel:
        errorMessage = "the request is cancelled";
        break;
      case DioErrorType.connectTimeout:
        errorMessage = "timeout";
        break;
      case DioErrorType.other:
        if (error != null && error is SocketException) {
          errorMessage = "no internet access";
        }
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = "the request is cancelled";
        break;
      case DioErrorType.sendTimeout:
        errorMessage = "sent timeout";
        break;
      default:
        final data = ErrorResponse.fromJson(response?.data);
        errorMessage = data.errorMessage ?? "something went wrong!";
        break;
    }
    return errorMessage;
  }
}
