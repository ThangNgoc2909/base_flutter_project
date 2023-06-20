import 'dart:async';
import 'package:base_project/base/base_cubit/base_cubit.dart';
import 'package:base_project/common/common_cubit/common_state.dart';
import 'package:injectable/injectable.dart';
import '../../navigation/app_route_info.dart';

@Injectable()
class CommonCubit extends BaseCubit<CommonState> {
  CommonCubit() : super(const CommonState());

  FutureOr onForceLogout() async {
    await navigator.replace(const AppRouteInfo.login());
  }
}
