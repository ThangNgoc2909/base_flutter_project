import '../../../navigation/app_navigation/app_navigator.dart';
import '../remote/remote_exceptions.dart';

class ExceptionHandler {
  const ExceptionHandler({
    required this.navigator,
    required this.listener,
  });

  final AppNavigator navigator;
  final ExceptionHandlerListener listener;

  Future<void> handleException(RemoteException exception) async {
    final message = exception.kind;

    switch (message) {
      case RemoteExceptionKind.noInternet:
        navigator.showErrorDialog(
          "Hãy truy cập mạng để tiếp tục",
          duration: const Duration(seconds: 2),
        );
        break;
      case RemoteExceptionKind.network:
        navigator.showErrorDialog(
          "Không kết nối được với máy chủ",
          duration: const Duration(seconds: 2),
        );
        break;
      case RemoteExceptionKind.serverDefined:
        // TODO: Handle this case.
        break;
      case RemoteExceptionKind.serverUndefined:
        navigator.showErrorDialog(
          "Máy chủ không phản hồi",
          duration: const Duration(seconds: 2),
        );
        break;
      case RemoteExceptionKind.refreshTokenFailed:
        _showErrorRefreshTokenDialog();
        break;
      case RemoteExceptionKind.timeout:
        navigator.showErrorDialog(
          "Máy chủ không phản hồi",
          duration: const Duration(seconds: 2),
        );
        break;
      case RemoteExceptionKind.cancellation:
        // TODO: Handle this case.
        break;
      case RemoteExceptionKind.unknown:
        navigator.showErrorDialog(
          "Xảy ra lỗi",
          duration: const Duration(seconds: 2),
        );
        break;
    }
  }

  Future<void> _showErrorRefreshTokenDialog() async {
    navigator.showErrorDialog(
      "Phiên đăng nhập của bạn đã hết hạn. Hãy đăng nhập lại",
      duration: const Duration(seconds: 2),
    );
    await Future.delayed(const Duration(seconds: 2));
    listener.onRefreshTokenFailed();
  }
}

abstract class ExceptionHandlerListener {
  void onRefreshTokenFailed();
}
