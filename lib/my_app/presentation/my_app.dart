import 'package:base_project/injector/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../base/base_cubit/base_state.dart';
import '../../common/constants/constants.dart';
import '../../navigation/app_navigation_observer.dart';
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
  final _appRouter = getIt.get<AppRouter>();

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
              initialRoutes:
                  !state.isLoggedIn ? [const LoginRoute()] : [const MainRoute()],
              navigatorObservers: () => [AppNavigatorObserver()],
            ),
            routeInformationParser: _appRouter.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
