import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../injector.dart';
import '../base_bloc/base_bloc.dart';
import '../base_bloc/base_state.dart';

abstract class BaseState<W extends StatefulWidget, E, S extends BaseBlocState,
    B extends BaseBloc<E, S>> extends State<W> with BaseMethodMixin<S> {
  late B bloc;

  B provideBloc(BuildContext context) {
    return injector.get<B>();
  }

  void initBloc(BuildContext context) {
    bloc = provideBloc(context);
  }

  Widget blocBuilder(Widget Function(BuildContext c, S) builder,
      {bool Function(S, S)? buildWhen}) {
    return BlocBuilder<B, S>(
      bloc: bloc,
      buildWhen: buildWhen,
      builder: builder,
    );
  }

  @override
  void initState() {
    initBloc(context);
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @required
  Widget renderUI(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocListener<B, S>(
        listenWhen: listenWhen,
        listener: listener,
        child: renderUI(context),
      ),
    );
  }
}

abstract class BaseShareState<
    W extends StatefulWidget,
    E,
    S extends BaseBlocState,
    B extends BaseBloc<E, S>> extends State<W> with BaseMethodMixin<S> {
  late B bloc;

  B provideBloc(BuildContext context) {
    return injector.get<B>();
  }

  void initBloc(BuildContext context) {
    bloc = provideBloc(context);
  }

  @override
  void initState() {
    initBloc(context);
    super.initState();
  }

  Widget blocBuilder(Widget Function(BuildContext c, S) builder,
      [bool Function(S, S)? buildWhen]) {
    return BlocBuilder<B, S>(
      bloc: bloc,
      buildWhen: buildWhen,
      builder: builder,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @required
  Widget renderUI(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocListener<B, S>(
        listenWhen: listenWhen,
        listener: listener,
        child: renderUI(context),
      ),
    );
  }
}

mixin BaseMethodMixin<S extends BaseBlocState> {
  // void showMessage(BuildContext context, String message,
  //     {type = SnackBarType.success}) {
  //   final SnackBarHelper helper = injector<SnackBarHelper>();
  //   switch (type) {
  //     case SnackBarType.error:
  //       helper.showError(context, message);
  //       break;
  //     case SnackBarType.info:
  //       helper.showInfo(context, message);
  //       break;
  //     default:
  //       helper.showSuccess(context, message);
  //       break;
  //   }
  // }

  bool listenWhen(S previous, S current) {
    return previous != current ||
        previous.status != current.status ||
        previous.message != current.message;
  }

  void listener(BuildContext context, S state) {}
}
