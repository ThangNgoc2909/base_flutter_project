import 'package:base_project/base/base_cubit/base_cubit.dart';
import 'package:base_project/features/authentication/login/bloc/login_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void onChangeAccount(String email) {
    emit(state.copyWith(password: email));
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
}
