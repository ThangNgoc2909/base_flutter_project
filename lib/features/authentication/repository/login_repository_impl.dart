import 'package:base_project/features/authentication/data/models/login_model.dart';
import 'package:base_project/features/authentication/data/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../dio_config/exceptions/remote/remote_exceptions.dart';
import '../data/service/auth_service.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  LoginRepositoryImpl(this._authClient);

  final AuthService _authClient;

  @override
  Future<Either<RemoteException, LoginModel>> login(
      String email, String password) async {
    try {
      final response = await _authClient.login(email, password);
      if (response.data != null) {
        return right(response.data!);
      } else {
        return left(const RemoteException(kind: RemoteExceptionKind.unknown));
      }
    } on RemoteException catch (err) {
      return left(err);
    }
  }
}
