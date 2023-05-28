import 'package:injectable/injectable.dart';
import '../../dio_config/exceptions/remote/server_error_detail.dart';
import '../../dio_config/exceptions/remote/server_errors.dart';
import 'base_error_response_mapper.dart';

@Injectable()
// ignore: avoid-dynamic
class JsonArrayErrorResponseMapper
    extends BaseErrorResponseMapper<List<dynamic>> {
  @override
  // ignore: avoid-dynamic
  ServerError mapToEntity(List<dynamic>? data) {
    return ServerError(
      errors: data
              ?.map((jsonObject) => ServerErrorDetail(
                    statusCode: jsonObject['code'],
                    message: jsonObject['message'],
                  ))
              .toList(growable: false) ??
          <ServerErrorDetail>[],
    );
  }
}
