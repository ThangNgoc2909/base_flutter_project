import 'dart:async';

import 'package:base_project/base/base_cubit/base_cubit.dart';
import 'package:injectable/injectable.dart';
import '../../navigation/app_route_info.dart';
import 'common_state.dart';

@Injectable()
class CommonCubit extends BaseCubit<CommonState> {
  CommonCubit() : super(const CommonState()) {

    FutureOr onForceLogout() async {
      await navigator.replace(const AppRouteInfo.login());
    }
  }
}
