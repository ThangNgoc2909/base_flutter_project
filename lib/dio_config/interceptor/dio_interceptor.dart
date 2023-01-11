import 'package:dio/dio.dart';

enum ErrorMessageType {
  invalidRefreshToken,
  notHavePermission,
  unauthorized,
  userNotFound,
  otpNotFound,
  usernameNotFound,
  verifyAccount,
}

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

// Future _handleRefreshToken(DioError err) async {
//   RequestOptions options = err.response!.requestOptions;
//   final refreshToken =
//       await Injector.container<AppPreference>().getRefreshToken();
//   final response = await Injector.container<AuthenticationRepository>()
//       .refreshToken(RefreshTokenRequest(
//           grantType: AuthenticationGrantType.refresh_token.key,
//           refreshToken: refreshToken));
//   final tokenModel = LoginModel.parseModel(response);
//   Injector.container<AppPreference>()
//       .saveToken(tokenModel.accessToken, tokenModel.refreshToken);
//   options.headers[Configurations.authentication] =
//       Configurations.getBearerAuth(response.accessToken);
//   return dio.request(options.path, options: options);
// }

extension ErrorMessageExtension on ErrorMessageType {
  String get message {
    switch (this) {
      case ErrorMessageType.invalidRefreshToken:
        return 'Invalid refresh token';
      case ErrorMessageType.notHavePermission:
        return 'You don\'t have permission';
      case ErrorMessageType.unauthorized:
        return 'Unauthorized';
      case ErrorMessageType.userNotFound:
        return 'User not found';
      case ErrorMessageType.otpNotFound:
        return "OTP not found";
      case ErrorMessageType.usernameNotFound:
        return "username not found";
      case ErrorMessageType.verifyAccount:
        return "Please verify your account!";
    }
  }
}
