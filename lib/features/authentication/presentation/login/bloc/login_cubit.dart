import 'dart:async';
import 'package:base_project/base/base_cubit/base_cubit.dart';
import 'package:base_project/features/authentication/data/repository/login_repository.dart';
import 'package:base_project/navigation/app_route_info/app_route_info.dart';
import 'package:injectable/injectable.dart';
import 'login_state.dart';

@Injectable()
class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(this._loginRepository) : super(const LoginState());

  final LoginRepository _loginRepository;

  void onChangeAccount(String email) {
    emit(state.copyWith(email: email));
  }

  void onChangePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void onChangeVisibility() {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  void onRemember() {
    emit(state.copyWith(isRemember: !state.isRemember));
  }

  FutureOr onLogin() async {
    navigator.showLoadingDialog("Đang đăng nhập, vui lòng đợi");
    final res = await _loginRepository.login(state.email, state.password);
    navigator.pop();
    res.fold(
      (l) {
        navigator.showErrorDialog(l.generalServerMessage ?? "");
      },
      (r) {
        navigator.replace(const AppRouteInfo.main());
      },
    );
  }
}
