import 'package:injectable/injectable.dart';
import '../../dio_config/exceptions/remote/server_errors.dart';
import 'base_error_response_mapper.dart';

@Injectable()
class JsonObjectErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToEntity(Map<String, dynamic>? data) {
    return ServerError(
      statusCode: data?['error']?['status_code'],
      errorId: data?['error']?['error_code'],
      message: data?['error']?['message'],
    );
  }
}
