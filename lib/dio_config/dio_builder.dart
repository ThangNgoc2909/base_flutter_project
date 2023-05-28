import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';

import '../common/constants/base_constants.dart';

class DioBuilder {
  const DioBuilder._();

  static Dio createDio({
    BaseOptions? options,
  }) {
    return Dio(
      BaseOptions(
        connectTimeout: options?.connectTimeout ??
            const Duration(milliseconds: ServerTimeoutConstants.connectTimeout),
        receiveTimeout: options?.receiveTimeout ??
            const Duration(milliseconds: ServerTimeoutConstants.receiveTimeout),
        sendTimeout: options?.sendTimeout ??
            const Duration(milliseconds: ServerTimeoutConstants.sendTimeout),
        baseUrl: options?.baseUrl ?? FlutterConfig.get("BASE_URL"),
      ),
    );
  }
}
