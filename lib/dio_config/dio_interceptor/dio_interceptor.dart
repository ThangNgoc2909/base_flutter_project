import 'package:dio/dio.dart';

class DioInterceptor implements Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.data is! Map<String, dynamic>) {
      return handler.reject(err);
    }
    return handler.reject(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if ((response.data as Map<String, dynamic>)['data'] != null) {
      return handler.resolve(response);
    }
    handler.next(response);
  }
}
