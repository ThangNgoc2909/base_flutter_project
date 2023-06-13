import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../dio_config/exceptions/remote/remote_exceptions.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(false) bool isLoggedIn,
    @Default(false) bool isLoading,
    RemoteException? exception,
  }) = _AppState;
}
