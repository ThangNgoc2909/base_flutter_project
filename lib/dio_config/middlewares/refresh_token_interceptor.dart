import 'dart:collection';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../base/base_interceptor.dart';
import '../../base/base_rest_api/none_auth_app_client.dart';
import '../../common/constants/server/server_constants.dart';
import '../../my_app/data/service/app_service.dart';
import '../../preferences/app_preferences.dart';

@Injectable()
class RefreshTokenInterceptor extends BaseInterceptor {
  RefreshTokenInterceptor(
    this.appPreferences,
    this.refreshTokenService,
    this._noneAuthAppServerApiClient,
  );

  final AppPreferences appPreferences;
  final RefreshTokenApiService refreshTokenService;
  final NoneAuthAppServerApiClient _noneAuthAppServerApiClient;

  var _isRefreshing = false;
  final _queue = Queue<Tuple2<RequestOptions, ErrorInterceptorHandler>>();

  @override
  int get priority => BaseInterceptor.refreshTokenPriority;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == HttpStatus.unauthorized ||
        err.response?.statusCode == HttpStatus.forbidden) {
      final options = err.response!.requestOptions;
      _onExpiredToken(options, handler);
    } else {
      handler.next(err);
    }
  }

  void _putAccessToken(Map<String, dynamic> headers, String accessToken) {
    headers[ServerRequestResponseConstants.basicAuthorization] =
        '${ServerRequestResponseConstants.bearer} $accessToken';
  }

  void _onExpiredToken(
      RequestOptions options, ErrorInterceptorHandler handler) {
    _queue.addLast(Tuple2(options, handler));
    if (!_isRefreshing) {
      _isRefreshing = true;
      _refreshToken()
          .then(_onRefreshTokenSuccess)
          .catchError(_onRefreshTokenError)
          .whenComplete(() {
        _isRefreshing = false;
        _queue.clear();
      });
    }
  }

  Future<String?> _refreshToken() async {
    _isRefreshing = true;
    final refreshToken = appPreferences.refreshToken;
    if (refreshToken != null) {
      final refreshTokenResponse =
          await refreshTokenService.refreshToken(refreshToken);
      await Future.wait(
        [
          appPreferences.saveAccessToken(refreshTokenResponse ?? ""),
        ],
      );
      return refreshTokenResponse;
    }
    return null;
  }

  Future<void> _onRefreshTokenSuccess(String? newToken) async {
    if (newToken != null) {
      await Future.wait(_queue.map(
        (requestInfo) => _requestWithNewToken(
            requestInfo.value1, requestInfo.value2, newToken),
      ));
    }
  }

  void _onRefreshTokenError(Object? error) {
    for (var element in _queue) {
      final options = element.value1;
      final handler = element.value2;
      handler.next(DioError(requestOptions: options, error: error));
    }
  }

  Future<void> _requestWithNewToken(
    RequestOptions options,
    ErrorInterceptorHandler handler,
    String newAccessToken,
  ) {
    _putAccessToken(options.headers, newAccessToken);

    return _noneAuthAppServerApiClient
        .fetch(options)
        .then((response) => handler.resolve(response))
        .catchError(
            (e) => handler.next(DioError(requestOptions: options, error: e)));
  }
}
