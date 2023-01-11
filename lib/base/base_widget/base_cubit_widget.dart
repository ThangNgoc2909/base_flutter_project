import 'package:dm_tool/base/base_cubit/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../injector/injector.dart';

abstract class BaseCubitWidget<W extends StatefulWidget, S,
    B extends BaseCubit<S>> extends State<W> {
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

  bool listenWhen(S previous, S current) {
    return previous != current;
  }

  void listener(BuildContext context, S state) {}
}
