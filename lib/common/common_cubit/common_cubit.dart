import 'dart:async';
import 'package:base_project/base/base_cubit/base_cubit.dart';
import 'package:base_project/common/common_cubit/common_state.dart';
import 'package:base_project/preferences/app_preferences.dart';
import 'package:injectable/injectable.dart';
import '../../navigation/app_route_info/app_route_info.dart';

@Injectable()
class CommonCubit extends BaseCubit<CommonState> {
  CommonCubit(this._appPreferences) : super(const CommonState());

  final AppPreferences _appPreferences;

  FutureOr onForceLogout() async {
    _appPreferences.clearCurrentUserData();
    await navigator.replace(const AppRouteInfo.login());
  }
}
