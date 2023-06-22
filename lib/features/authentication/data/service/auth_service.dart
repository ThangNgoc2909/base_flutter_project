import 'package:base_project/base/base_rest_api/none_auth_app_client.dart';
import 'package:base_project/features/authentication/data/models/login_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../base/base_model/base_model.dart';
import '../../../../base/base_rest_api/rest_api_client.dart';
import '../../../../common/constants/server/api_constants.dart';

@LazySingleton()
class AuthService {
  AuthService(this._noneAuthAppClient);

  final NoneAuthAppServerApiClient _noneAuthAppClient;

  Future<BaseData<LoginModel>> login(String email, String password) async {
    final response = await _noneAuthAppClient.request(
      method: RestMethod.post,
      path: Api.login,
      body: {
        'username': email,
        'password': password,
        'system_key': Api.systemKey,
      },
    );
    final value = BaseData<LoginModel>.fromJson(
      response,
      (json) => LoginModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }
}
