import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../dio_config/middlewares/connectivity_interceptor.dart';
import '../dio_config/middlewares/custom_log_interceptor.dart';

class ApiClientDefaultSetting {
  const ApiClientDefaultSetting._();

  // required interceptors
  static List<Interceptor> requiredInterceptors(Dio dio) => [
    if (kDebugMode) CustomLogInterceptor(),
    ConnectivityInterceptor(),
    // RetryOnErrorInterceptor(dio),
  ];
}