// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_pages.dart';

class _$AppPages extends RootStackRouter {
  _$AppPages([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    ExampleRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ExamplePage(),
        opaque: true,
        barrierDismissible: false,
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          ExampleRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [ExamplePage]
class ExampleRoute extends PageRouteInfo<void> {
  const ExampleRoute()
      : super(
          ExampleRoute.name,
          path: '/',
        );

  static const String name = 'ExampleRoute';
}
