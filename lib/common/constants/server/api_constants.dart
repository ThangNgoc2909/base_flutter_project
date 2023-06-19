import 'package:flutter_config/flutter_config.dart';

class Api {
  static String KEY = "AD";

  ///authentication
  static String baseURL = "https://api.thachlonghai.co";
  static String login = "${FlutterConfig.get("BASE_URL")}/account/api/login";
  static String refresh_token =
      "${FlutterConfig.get("BASE_URL")}/account/api/refresh_token";
}
