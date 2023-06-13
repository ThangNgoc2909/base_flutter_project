import 'package:freezed_annotation/freezed_annotation.dart';

import '../../dio_config/exceptions/remote/remote_exceptions.dart';

part 'common_state.freezed.dart';

@freezed
class CommonState with _$CommonState {
  const factory CommonState({
    @Default(false) bool isLoading,
    RemoteException? exception,
  }) = _CommonState;
}
