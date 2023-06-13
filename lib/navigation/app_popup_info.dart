import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_popup_info.freezed.dart';

@freezed
class AppPopupInfo with _$AppPopupInfo {
  const factory AppPopupInfo.confirmDialog({
    @Default('') String message,
    VoidCallback? onPressed,
  }) = _ConfirmDialog;

  const factory AppPopupInfo.errorWithRetryDialog({
    @Default('') String message,
    VoidCallback? onRetryPressed,
  }) = _ErrorWithRetryDialog;

  const factory AppPopupInfo.requiredLoginDialog() = _RequiredLoginDialog;
}
