import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../base/base_interceptor.dart';
import '../../common/constants/server/server_constants.dart';
import '../../preferences/app_preferences.dart';

@Injectable()
class AccessTokenInterceptor extends BaseInterceptor {
  AccessTokenInterceptor(this._appPreferences);

  final AppPreferences _appPreferences;

  @override
  int get priority => BaseInterceptor.accessTokenPriority;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = _appPreferences.accessToken;
    if (token != null) {
      options.headers[ServerRequestResponseConstants.basicAuthorization] =
      '${ServerRequestResponseConstants.bearer} $token';
    }

    handler.next(options);
  }
}
