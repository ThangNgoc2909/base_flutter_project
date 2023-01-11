import 'package:auto_route/auto_route.dart';
import 'package:dm_tool/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'common/constant/constant.dart';
import 'injector/injector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  //init dependency injection
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = injector.get<AppPages>();
    return ScreenUtilInit(
      designSize: const Size(Constant.configWidth, Constant.configHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, index) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: AutoRouterDelegate(router),
          routeInformationParser: router.defaultRouteParser(),
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
          ),
        );
      },
    );
  }
}
