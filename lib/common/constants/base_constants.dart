class ServerTimeoutConstants {
  const ServerTimeoutConstants._();

  static const connectTimeout = 30000;
  static const receiveTimeout = 30000;
  static const sendTimeout = 30000;
}

class UrlConstants {
  const UrlConstants._();

  /// Url
  static const firebaseStorageBaseUrl =
      'https://firebasestorage.googleapis.com/';

  /// Path
  static const remoteConfigPath = '/config/RemoteConfig.json';
  static const settingsPath = '/mypage/settings';
}
