import 'package:base_project/base/base_rest_api/rest_api_client.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NoneAuthAppServerApiClient extends RestApiClient {
  NoneAuthAppServerApiClient();
}
