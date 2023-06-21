import 'dart:async';

import 'package:base_project/base/base_cubit/base_cubit.dart';
import 'package:base_project/common/constants/constants.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../navigation/app_route_info/app_route_info.dart';
import 'app_state.dart';

@LazySingleton()
class AppCubit extends BaseCubit<AppState> {
  AppCubit() : super(const AppState());

  void onIsLoggedIn(bool isLoggedIn) {
    emit(state.copyWith(isLoggedIn: isLoggedIn));
  }

  void onAppInitialized() {
    final token =
        GetIt.instance.get<SharedPreferences>().get(PrefKeys.accessToken);
    if (token != null) {
      emit(state.copyWith(isLoggedIn: true));
    } else {
      emit(state.copyWith(isLoggedIn: false));
    }
  }

  FutureOr onForceLogout() async {
    await navigator.replace(const AppRouteInfo.login());
  }
}
