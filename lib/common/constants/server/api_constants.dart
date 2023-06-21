import 'package:flutter_config/flutter_config.dart';

class Api {
  static String systemKey = "AD";
  static String baseURL = "${FlutterConfig.get("BASE_URL")}";

  ///authentication
  static String login = "$baseURL/account/api/login";
  static String refresh_token = "$baseURL/account/api/refresh_token";
}
