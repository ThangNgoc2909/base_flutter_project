import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../base/base_cubit/base_state.dart';
import '../../common/constants/constants.dart';
import '../../common/enums/enum.dart';
import '../../router/app_router.dart';
import '../../router/app_router.gr.dart';
import 'cubit/app_cubit.dart';
import 'cubit/app_state.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends BasePageState<MyApp, AppCubit> {
  final _appRouter = GetIt.instance.get<AppRouter>();

  @override
  bool get isAppWidget => true;

  @override
  void initState() {
    super.initState();
    bloc.onAppInitialized();
  }

  @override
  Widget buildPage(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        DeviceConstants.designDeviceWidth,
        DeviceConstants.designDeviceHeight,
      ),
      builder: (context, _) => BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            useInheritedMediaQuery: true,
            routerDelegate: _appRouter.delegate(
              initialRoutes: _mapRouteToPageRouteInfo(),
              navigatorObservers: () => [AppNavigatorObserver()],
            ),
            routeInformationParser: _appRouter.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }

  List<PageRouteInfo> _mapRouteToPageRouteInfo(
      LoadInitialResourceOutput initialResource) {
    return initialResource.initialRoutes.map((e) {
      switch (e) {
        case AppRoute.login:
          return const LoginRoute();
        case AppRoute.home:
          return const MainRoute();
      }
    }).toList(growable: false);
  }
}
