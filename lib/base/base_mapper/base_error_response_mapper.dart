import '../../dio_config/exceptions/remote/server_errors.dart';
import '../../shared/shared.dart';
import '../base_data_mapper.dart';
import 'firebase_storage_error_response_mapper.dart';
import 'json_array_error_response_mapper.dart';
import 'json_object_error_response_mapper.dart';

abstract class BaseErrorResponseMapper<T> extends BaseDataMapper<T, ServerError> {
  const BaseErrorResponseMapper();

  factory BaseErrorResponseMapper.fromType(ErrorResponseMapperType type) {
    switch (type) {
      case ErrorResponseMapperType.jsonObject:
        return JsonObjectErrorResponseMapper() as BaseErrorResponseMapper<T>;
      case ErrorResponseMapperType.jsonArray:
        return JsonArrayErrorResponseMapper() as BaseErrorResponseMapper<T>;
      case ErrorResponseMapperType.firebaseStorage:
        return FirebaseStorageErrorResponseMapper() as BaseErrorResponseMapper<T>;
    }
  }
}
