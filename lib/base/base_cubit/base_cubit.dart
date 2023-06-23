import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dio_config/exceptions/exception_handler/exception_handler.dart';
import '../../my_app/presentation/cubit/app_cubit.dart';
import '../../navigation/app_navigation/app_navigator.dart';
import 'mixin/event_transformer_mixin.dart';
import 'mixin/log_mixin.dart';

abstract class BaseCubit<S> extends BaseCubitDelegate<S>
    with EventTransformerMixin, LogMixin {
  BaseCubit(S initialState) : super(initialState);
}

abstract class BaseCubitDelegate<S> extends Cubit<S> {
  BaseCubitDelegate(S initialState) : super(initialState);

  late final AppNavigator navigator;
  late final AppCubit appCubit;
  late final ExceptionHandler exceptionHandler;
}
