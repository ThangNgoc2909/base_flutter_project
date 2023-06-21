import 'package:injectable/injectable.dart';

import '../../../base/base_rest_api/refresh_token_api_client.dart';
import '../../../base/base_rest_api/rest_api_client.dart';
import '../../../dio_config/exceptions/remote/remote_exceptions.dart';

@LazySingleton()
class RefreshTokenApiService {
  RefreshTokenApiService(this._refreshTokenApiClient);

  final RefreshTokenApiClient _refreshTokenApiClient;

  Future<String?> refreshToken(String refreshToken) async {
    try {
      final response = await _refreshTokenApiClient.request(
        method: RestMethod.post,
        path: '/v1/auth/refresh',
      );

      return response["access"];
    } catch (e) {
      if (e is RemoteException &&
          (e.kind == RemoteExceptionKind.serverDefined ||
              e.kind == RemoteExceptionKind.serverUndefined)) {
        throw const RemoteException(
            kind: RemoteExceptionKind.refreshTokenFailed);
      }

      rethrow;
    }
  }
}
