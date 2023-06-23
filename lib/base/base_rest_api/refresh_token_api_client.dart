import 'package:base_project/base/base_rest_api/rest_api_client.dart';
import 'package:injectable/injectable.dart';
import '../../dio_config/middlewares/access_token_interceptor.dart';

@LazySingleton()
class RefreshTokenApiClient extends RestApiClient {
  RefreshTokenApiClient(
    AccessTokenInterceptor accessTokenInterceptor,
  ) : super(interceptors: [accessTokenInterceptor]);
}
