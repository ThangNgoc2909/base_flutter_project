import 'package:injectable/injectable.dart';
import '../../dio_config/exceptions/remote/server_errors.dart';
import 'base_error_response_mapper.dart';

///Dùng để map lỗi từ Json (được định nghĩa bởi server) ra ServerError

@Injectable()
class JsonObjectErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToEntity(Map<String, dynamic>? data) {
    return ServerError(
      statusCode: data?['code'],
      errorId: data?['error_code'],
      message: data?['message'],
    );
  }
}
