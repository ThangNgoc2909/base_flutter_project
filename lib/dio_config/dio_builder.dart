import 'package:dio/dio.dart';
import '../common/constant/constant.dart';
import 'interceptor/dio_interceptor.dart';
import 'interceptor/dio_logger.dart';

class DioBuilder {
  Dio? _dio;

  Dio initDio() {
    if (_dio == null) {
      final BaseOptions options = BaseOptions(
          connectTimeout: 50000,
          receiveTimeout: 30000,
          baseUrl: Network().baseUrl,
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
