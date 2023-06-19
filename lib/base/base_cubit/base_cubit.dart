import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dio_config/exceptions/exception_handler/exception_handler.dart';
import '../../dio_config/exceptions/remote/remote_exceptions.dart';
import '../../my_app/presentation/cubit/app_cubit.dart';
import '../../navigation/app_navigator.dart';
import '../app_exception.dart';
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

  Future<void> handleException() async {
    // commonBloc.add(
    //   ExceptionEmitted(
    //     appExceptionWrapper: appExceptionWrapper,
    //   ),
    // );
  }

  bool _forceHandleError(AppException appException) {
    return appException is RemoteException &&
        appException.kind == RemoteExceptionKind.refreshTokenFailed;
  }
}
