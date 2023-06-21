import 'package:base_project/base/base_rest_api/rest_api_client.dart';
import 'package:injectable/injectable.dart';
import '../../dio_config/middlewares/access_token_interceptor.dart';
import '../../dio_config/middlewares/refresh_token_interceptor.dart';

@LazySingleton()
class AuthApiClient extends RestApiClient {
  AuthApiClient(
    AccessTokenInterceptor accessTokenInterceptor,
    RefreshTokenInterceptor refreshTokenInterceptor,
  ) : super(interceptors: [
          accessTokenInterceptor,
          refreshTokenInterceptor,
        ]);
}
