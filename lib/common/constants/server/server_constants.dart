import '../../../base/base_mapper/base_error_response_mapper.dart';

class ResponseMapperConstants {
  const ResponseMapperConstants._();

  static const defaultErrorResponseMapperType =
      ErrorResponseMapperType.jsonObject;
}

class ServerRequestResponseConstants {
  const ServerRequestResponseConstants._();

  static const basicAuthorization = 'Authorization';
  static const bearer = 'Bearer';
}
