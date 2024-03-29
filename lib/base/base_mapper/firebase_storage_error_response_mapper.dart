import 'package:injectable/injectable.dart';

import '../../dio_config/exceptions/remote/server_errors.dart';
import 'base_error_response_mapper.dart';

///Dùng để map lỗi từ Json (được định nghĩa bởi firebase) ra ServerError

@Injectable()
class FirebaseStorageErrorResponseMapper extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToEntity(Map<String, dynamic>? data) {
    return ServerError(
      statusCode: data?['error']['code'],
      message: data?['error']['message'],
    );
  }
}