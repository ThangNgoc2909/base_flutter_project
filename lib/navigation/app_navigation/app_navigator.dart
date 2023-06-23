import 'dart:async';
import 'package:flutter/material.dart';
import '../app_route_info/app_route_info.dart';

///navigation
///showDialog
///showSnackBar

abstract class AppNavigator {
  const AppNavigator();

  bool get canPopSelfOrChildren;

  int get currentBottomTab;

  String getCurrentRouteName({bool useRootNavigator = false});

  void popUntilRootOfCurrentBottomTab();

  void navigateToBottomTab(int index, {bool notify = true});

  ///navigation
  Future<T?> push<T extends Object?>(AppRouteInfo appRouteInfo);

  Future<void> pushAll(List<AppRouteInfo> listAppRouteInfo);

  Future<T?> replace<T extends Object?>(AppRouteInfo appRouteInfo);

  Future<void> replaceAll(List<AppRouteInfo> listAppRouteInfo);

  Future<bool> pop<T extends Object?>({
    T? result,
    bool useRootNavigator = false,
  });

  Future<T?> popAndPush<T extends Object?, R extends Object?>(
    AppRouteInfo appRouteInfo, {
    R? result,
    bool useRootNavigator = false,
  });

  Future<void> popAndPushAll(List<AppRouteInfo> listAppRouteInfo,
      {bool useRootNavigator = false});

  void popUntilRoot({bool useRootNavigator = false});

  void popUntilRouteName(String routeName);

  bool removeUntilRouteName(String routeName);

  bool removeAllRoutesWithName(String routeName);

  bool removeLast();

  ///showSnackBar
  void showErrorSnackBar(String message, {Duration? duration});

  void showSuccessSnackBar(String message, {Duration? duration});

  ///showDialog
  void showSuccessDialog({
    required BuildContext context,
    required String content,
    VoidCallback? accept,
    VoidCallback? extraAccept,
    String? mainTitle,
    String? extraTitle,
    bool hasButton = true,
  });

  FutureOr showErrorDialog(String message, {Duration? duration});

  FutureOr showLoadingDialog(String message);
}
