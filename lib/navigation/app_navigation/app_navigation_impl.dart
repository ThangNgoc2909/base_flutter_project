import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:base_project/utils/dialog_utils.dart';
import 'package:base_project/utils/snackbar_utils.dart';
import 'package:flutter/material.dart' as m;
import 'package:injectable/injectable.dart';
import '../../base/base_cubit/mixin/log_mixin.dart';
import '../../base/base_navigation/base_route_info_mapper.dart';
import '../../common/constants/app_colors.dart';
import '../../config/log_config.dart';
import '../../router/app_router.dart';
import 'app_navigator.dart';
import '../app_route_info/app_route_info.dart';

@LazySingleton(as: AppNavigator)
class AppNavigatorImpl extends AppNavigator with LogMixin {
  AppNavigatorImpl(
    this._appRouter,
    this._appRouteInfoMapper,
  );

  // final tabRoutes = const [
  //   BottomTabHomeRouter(),
  //   BottomTabSearchRouter(),
  //   BottomTabMyPageRouter(),
  // ];

  TabsRouter? tabsRouter;

  final AppRouter _appRouter;
  final BaseRouteInfoMapper _appRouteInfoMapper;

  StackRouter? get _currentTabRouter =>
      tabsRouter?.stackRouterOfIndex(currentBottomTab);

  StackRouter get _currentTabRouterOrRootRouter =>
      _currentTabRouter ?? _appRouter;

  m.BuildContext get _rootRouterContext =>
      _appRouter.navigatorKey.currentContext!;

  m.BuildContext? get _currentTabRouterContext =>
      _currentTabRouter?.navigatorKey.currentContext;

  m.BuildContext get _currentTabContextOrRootContext =>
      _currentTabRouterContext ?? _rootRouterContext;

  @override
  int get currentBottomTab {
    if (tabsRouter == null) {
      throw 'Not found any TabRouter';
    }

    return tabsRouter?.activeIndex ?? 0;
  }

  @override
  bool get canPopSelfOrChildren => _appRouter.canPop();

  @override
  String getCurrentRouteName({bool useRootNavigator = false}) =>
      AutoRouter.of(useRootNavigator
              ? _rootRouterContext
              : _currentTabContextOrRootContext)
          .current
          .name;

  @override
  void popUntilRootOfCurrentBottomTab() {
    if (tabsRouter == null) {
      throw 'Not found any TabRouter';
    }

    if (_currentTabRouter?.canPop() == true) {
      if (LogConfig.enableNavigatorObserverLog) {
        logD('popUntilRootOfCurrentBottomTab');
      }
      _currentTabRouter?.popUntilRoot();
    }
  }

  @override
  void navigateToBottomTab(int index, {bool notify = true}) {
    if (tabsRouter == null) {
      throw 'Not found any TabRouter';
    }

    if (LogConfig.enableNavigatorObserverLog) {
      logD('navigateToBottomTab with index = $index, notify = $notify');
    }
    tabsRouter?.setActiveIndex(index, notify: notify);
  }

  @override
  Future<T?> push<T extends Object?>(AppRouteInfo appRouteInfo) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('push $appRouteInfo');
    }

    return _appRouter.push<T>(_appRouteInfoMapper.map(appRouteInfo));
  }

  @override
  Future<void> pushAll(List<AppRouteInfo> listAppRouteInfo) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('pushAll $listAppRouteInfo');
    }

    return _appRouter.pushAll(_appRouteInfoMapper.mapList(listAppRouteInfo));
  }

  @override
  Future<T?> replace<T extends Object?>(AppRouteInfo appRouteInfo) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('replace by $appRouteInfo');
    }

    return _appRouter.replace<T>(_appRouteInfoMapper.map(appRouteInfo));
  }

  @override
  Future<void> replaceAll(List<AppRouteInfo> listAppRouteInfo) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('replaceAll by $listAppRouteInfo');
    }

    return _appRouter.replaceAll(_appRouteInfoMapper.mapList(listAppRouteInfo));
  }

  @override
  Future<bool> pop<T extends Object?>(
      {T? result, bool useRootNavigator = false}) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('pop with result = $result, useRootNav = $useRootNavigator');
    }

    return useRootNavigator
        ? _appRouter.pop<T>(result)
        : _currentTabRouterOrRootRouter.pop<T>(result);
  }

  @override
  Future<T?> popAndPush<T extends Object?, R extends Object?>(
    AppRouteInfo appRouteInfo, {
    R? result,
    bool useRootNavigator = false,
  }) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD(
          'popAndPush $appRouteInfo with result = $result, useRootNav = $useRootNavigator');
    }

    return useRootNavigator
        ? _appRouter.popAndPush<T, R>(_appRouteInfoMapper.map(appRouteInfo),
            result: result)
        : _currentTabRouterOrRootRouter.popAndPush<T, R>(
            _appRouteInfoMapper.map(appRouteInfo),
            result: result,
          );
  }

  @override
  void popUntilRoot({bool useRootNavigator = false}) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('popUntilRoot, useRootNav = $useRootNavigator');
    }

    useRootNavigator
        ? _appRouter.popUntilRoot()
        : _currentTabRouterOrRootRouter.popUntilRoot();
  }

  @override
  void popUntilRouteName(String routeName) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('popUntilRouteName $routeName');
    }

    _appRouter.popUntilRouteWithName(routeName);
  }

  @override
  bool removeUntilRouteName(String routeName) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('removeUntilRouteName $routeName');
    }

    return _appRouter.removeUntil((route) => route.name == routeName);
  }

  @override
  bool removeAllRoutesWithName(String routeName) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('removeAllRoutesWithName $routeName');
    }

    return _appRouter.removeWhere((route) => route.name == routeName);
  }

  @override
  Future<void> popAndPushAll(List<AppRouteInfo> listAppRouteInfo,
      {bool useRootNavigator = false}) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('popAndPushAll $listAppRouteInfo, useRootNav = $useRootNavigator');
    }

    return useRootNavigator
        ? _appRouter
            .popAndPushAll(_appRouteInfoMapper.mapList(listAppRouteInfo))
        : _currentTabRouterOrRootRouter
            .popAndPushAll(_appRouteInfoMapper.mapList(listAppRouteInfo));
  }

  @override
  bool removeLast() {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('removeLast');
    }

    return _appRouter.removeLast();
  }

  @override
  void showErrorSnackBar(String message, {Duration? duration}) {
    SnackBarUtils.showAppSnackBar(
      _rootRouterContext,
      message,
      duration: duration,
      backgroundColor: AppColors.red_1,
    );
  }

  @override
  void showSuccessSnackBar(String message, {Duration? duration}) {
    SnackBarUtils.showAppSnackBar(
      _rootRouterContext,
      message,
      duration: duration,
      backgroundColor: AppColors.mainColor,
    );
  }

  @override
  void showErrorDialog(String message, {Duration? duration}) {
    DialogUtils.showErrorDialog(
      _rootRouterContext,
      content: message,
    );
  }

  @override
  void showLoadingDialog(String message) {
    DialogUtils.showLoadingDialog(
      _rootRouterContext,
      message: message,
    );
  }

  @override
  FutureOr showSuccessDialog(
      {required m.BuildContext context,
      required String content,
      m.VoidCallback? accept,
      m.VoidCallback? extraAccept,
      String? mainTitle,
      String? extraTitle,
      bool hasButton = true}) {
    return DialogUtils.showSuccessDialog(
      _rootRouterContext,
      content: content,
      accept: accept,
      extraAccept: extraAccept,
      extraTitle: extraTitle,
      mainTitle: mainTitle,
      hasButton: hasButton,
    );
  }
}
