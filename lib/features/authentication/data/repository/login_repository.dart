import 'package:dartz/dartz.dart';
import '../../../../dio_config/exceptions/remote/remote_exceptions.dart';
import '../models/login_model.dart';

abstract class LoginRepository {
  Future<Either<RemoteException, LoginModel>> login(
      String email, String password);
}
