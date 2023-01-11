import 'package:flutter_config/flutter_config.dart';

class Authentication {
  static const String authToken = 'LFvr6nr0a_DU8vEjwCuhCXG9x4jtb3RzBTiFv4iqQt';
  static const String userId = 'nopXXcZcbeTvgc3qo';
}

class Network {
  String get baseUrl => FlutterConfig.get('BASE_URL');
}

class NotificationConfig {
  static const highImportance = "High Importance channel";
  static const highChannelId = "flutter_channel_id_0";
  static const highChannelDescription = "Floating notification with sound";
  static const notificationIconPath = 'ic_notification';
}

class Constant {
  static const double configWidth = 414;
  static const double configHeight = 896;
}
