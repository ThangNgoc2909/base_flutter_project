import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import '../base/base_navigation/base_route_info_mapper.dart';
import '../router/app_router.gr.dart';
import 'app_route_info.dart';

@LazySingleton(as: BaseRouteInfoMapper)
class AppRouteInfoMapper extends BaseRouteInfoMapper {
  @override
  PageRouteInfo map(AppRouteInfo appRouteInfo) {
    return appRouteInfo.when(
      login: () => const LoginRoute(),
      main: () => const MainRoute(),
    );
  }
}
