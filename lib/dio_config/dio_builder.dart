import 'package:dio/dio.dart';
import '../../../dio_config/dio_interceptor/dio_interceptor.dart';
import 'logger/dio_logger.dart';

class DioBuilder {
  Dio? _dio;

  Dio initDio() {
    if (_dio == null) {
      final BaseOptions options = BaseOptions(
          connectTimeout: const Duration(minutes: 5),
          receiveTimeout: const Duration(minutes: 3),
          baseUrl: 'http://localhost:3005',
          receiveDataWhenStatusError: true,
          headers: {'accept': 'application/json'});
      _dio = Dio(options);
      _dio?.options.headers["Content-Type"] = 'application/json';
      _dio?.interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
        DioInterceptor(),
      ]);
    }
    return _dio!;
  }
}
