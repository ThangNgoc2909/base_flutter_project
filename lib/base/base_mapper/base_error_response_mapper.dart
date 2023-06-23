import '../../dio_config/exceptions/remote/server_errors.dart';
import '../base_data_mapper.dart';
import 'firebase_storage_error_response_mapper.dart';
import 'json_object_error_response_mapper.dart';

enum ErrorResponseMapperType {
  jsonObject,
  firebaseStorage,
}

/// Dùng để phân loại lỗi trả về dựa theo ErrorResponseMapperType:
///
/// Trường hợp jsonObject là kiểu json mà server thường trả về
///
/// Trường hợp firebaseStorage là kiểu json mà firebase storage trả về

abstract class BaseErrorResponseMapper<T> extends BaseDataMapper<T, ServerError> {
  const BaseErrorResponseMapper();

  factory BaseErrorResponseMapper.fromType(ErrorResponseMapperType type) {
    switch (type) {
      case ErrorResponseMapperType.jsonObject:
        return JsonObjectErrorResponseMapper() as BaseErrorResponseMapper<T>;
      case ErrorResponseMapperType.firebaseStorage:
        return FirebaseStorageErrorResponseMapper() as BaseErrorResponseMapper<T>;
    }
  }
}
