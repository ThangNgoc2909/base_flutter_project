import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import '../common/constants/base_constants.dart';
import '../common/constants/server/server_constants.dart';
import '../dio_config/dio_builder.dart';
import '../dio_config/exceptions/exception_mapper/dio_exception_mapper.dart';
import '../shared/shared.dart';
import 'api_client_default_settings.dart';
import 'base_interceptor.dart';
import 'base_mapper/base_error_response_mapper.dart';

enum RestMethod { get, post, put, patch, delete }

class RestApiClient {
  RestApiClient({
    this.baseUrl = '',
    this.interceptors = const [],
    this.errorResponseMapperType =
        ResponseMapperConstants.defaultErrorResponseMapperType,
    this.connectTimeout = ServerTimeoutConstants.connectTimeout,
    this.sendTimeout = ServerTimeoutConstants.sendTimeout,
    this.receiveTimeout = ServerTimeoutConstants.receiveTimeout,
  }) : _dio = DioBuilder.createDio(
          options: BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: Duration(milliseconds: connectTimeout),
            sendTimeout: Duration(milliseconds: connectTimeout),
            receiveTimeout: Duration(milliseconds: receiveTimeout),
          ),
        ) {
    final sortedInterceptors = [
      ...ApiClientDefaultSetting.requiredInterceptors(_dio),
      ...interceptors,
    ].sortedByDescending((element) {
      return element is BaseInterceptor ? element.priority : -1;
    });

    _dio.interceptors.addAll(sortedInterceptors);
  }

  final ErrorResponseMapperType errorResponseMapperType;
  final String baseUrl;
  final int connectTimeout;
  final int sendTimeout;
  final int receiveTimeout;
  final List<Interceptor> interceptors;
  final Dio _dio;

  Future<T> request<T, D>({
    required RestMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    // ignore: avoid-dynamic
    dynamic body,
    ErrorResponseMapperType? errorResponseMapperType,
    BaseErrorResponseMapper? errorResponseMapper,
    Map<String, dynamic>? headers,
    String? contentType,
    ResponseType? responseType,
    int? sendTimeout,
    int? receiveTimeout,
  }) async {
    try {
      final response = await _requestByMethod(
        method: method,
        path: path.startsWith(baseUrl) ? path.substring(baseUrl.length) : path,
        queryParameters: queryParameters,
        body: body,
        options: Options(
          headers: headers,
          contentType: contentType,
          responseType: responseType,
          sendTimeout: Duration(
            milliseconds: sendTimeout ?? ServerTimeoutConstants.sendTimeout,
          ),
          receiveTimeout: Duration(
            milliseconds:
                receiveTimeout ?? ServerTimeoutConstants.receiveTimeout,
          ),
        ),
      );

      return response.data;
    } catch (error) {
      throw DioExceptionMapper(
        errorResponseMapper ??
            BaseErrorResponseMapper.fromType(
              errorResponseMapperType ?? this.errorResponseMapperType,
            ),
      ).map(error);
    }
  }

  Future<Response> _requestByMethod({
    required RestMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    // ignore: avoid-dynamic
    dynamic body,
    Options? options,
  }) {
    switch (method) {
      case RestMethod.get:
        return _dio.get(
          path,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.post:
        return _dio.post(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.patch:
        return _dio.patch(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.put:
        return _dio.put(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.delete:
        return _dio.delete(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
    }
  }
}
