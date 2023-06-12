import 'package:freezed_annotation/freezed_annotation.dart';
import '../app_exception_wrapper.dart';
part 'common_state.freezed.dart';

@freezed
class CommonState with _$CommonState {
  const factory CommonState({
    AppExceptionWrapper? appExceptionWrapper,
    @Default(false) bool isLoading,
  }) = _CommonState;
}
