import 'dart:ui';
import '../../../common/constants/duration/duration_constants.dart';
import '../../../navigation/app_navigator.dart';
import '../../../navigation/app_popup_info.dart';
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
        // TODO: Handle this case.
        break;
      case RemoteExceptionKind.network:
        // TODO: Handle this case.
        break;
      case RemoteExceptionKind.serverDefined:
        // TODO: Handle this case.
        break;
      case RemoteExceptionKind.serverUndefined:
        // TODO: Handle this case.
        break;
      case RemoteExceptionKind.refreshTokenFailed:
        // TODO: Handle this case.
        break;
      case RemoteExceptionKind.timeout:
        // TODO: Handle this case.
        break;
      case RemoteExceptionKind.cancellation:
        // TODO: Handle this case.
        break;
      case RemoteExceptionKind.unknown:
        // TODO: Handle this case.
        break;
    }
  }

  void _showErrorSnackBar({
    required String message,
    Duration duration = DurationConstants.defaultErrorVisibleDuration,
  }) {
    navigator.showErrorSnackBar(message, duration: duration);
  }

  Future<void> _showErrorDialog({
    required String message,
    VoidCallback? onPressed,
    bool isRefreshTokenFailed = false,
  }) async {
    await navigator
        .showDialog(AppPopupInfo.confirmDialog(
      message: message,
      onPressed: onPressed,
    ))
        .then((value) {
      if (isRefreshTokenFailed) {
        listener.onRefreshTokenFailed();
      }
    });
  }

  Future<void> _showErrorDialogWithRetry({
    required String message,
    VoidCallback? onRetryPressed,
  }) async {
    await navigator.showDialog(AppPopupInfo.errorWithRetryDialog(
      message: message,
      onRetryPressed: onRetryPressed,
    ));
  }
}

abstract class ExceptionHandlerListener {
  void onRefreshTokenFailed();
}
