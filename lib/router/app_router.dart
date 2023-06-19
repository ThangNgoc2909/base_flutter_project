import 'package:auto_route/auto_route.dart';
import 'package:base_project/router/routes.dart';
import 'package:injectable/injectable.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
@singleton
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: Routes.login, page: LoginRoute.page),
        AutoRoute(path: Routes.home, page: MainRoute.page),
        AutoRoute(path: Routes.home, page: HomeRoute.page)
      ];
}
