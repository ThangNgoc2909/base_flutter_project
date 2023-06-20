import 'package:base_project/my_app/presentation/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../common/common_cubit/common_cubit.dart';
import '../../common/common_cubit/common_state.dart';
import '../../dio_config/exceptions/exception_handler/exception_handler.dart';
import '../../dio_config/exceptions/remote/remote_exceptions.dart';
import '../../injector/injector.dart';
import '../../navigation/app_navigator.dart';
import 'base_cubit.dart';

abstract class BasePageState<T extends StatefulWidget, B extends BaseCubit>
    extends BasePageStateDelegate<T, B> {}

abstract class BasePageStateDelegate<T extends StatefulWidget,
    B extends BaseCubit> extends State<T> implements ExceptionHandlerListener {
  late final AppNavigator navigator = getIt.get<AppNavigator>();
  late final AppCubit appCubit = getIt.get<AppCubit>();
  late final ExceptionHandler exceptionHandler = ExceptionHandler(
    navigator: navigator,
    listener: this,
  );

  late final CommonCubit commonBloc = getIt.get<CommonCubit>()
    ..navigator = navigator
    ..appCubit = appCubit
    ..exceptionHandler = exceptionHandler;

  late final B bloc = getIt.get<B>()
    ..navigator = navigator
    ..appCubit = appCubit
    ..exceptionHandler = exceptionHandler;


  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => navigator,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => bloc),
          BlocProvider(create: (_) => commonBloc),
        ],
        child: BlocListener<CommonCubit, CommonState>(
          listenWhen: (previous, current) =>
              previous.exception != current.exception &&
              current.exception != null,
          listener: (context, state) {
            handleException(state.exception!);
          },
          child: buildPage(context),
        ),
      ),
    );
  }

  Widget buildPage(BuildContext context);

  @override
  void dispose() {
    super.dispose();
  }

  void handleException(RemoteException exception) {
    exceptionHandler.handleException(exception);
  }

  @override
  void onRefreshTokenFailed() {
    // commonBloc.add(const ForceLogoutButtonPressed());
  }
}
