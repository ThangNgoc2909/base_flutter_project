import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../modules/example/example_page.dart';
import 'app_routes.dart';

part 'app_pages.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    CustomRoute(
      page: ExamplePage,
      path: AppRoutes.initial,
      initial: true,
    ),
  ],
)

@singleton
class AppPages extends _$AppPages {}
