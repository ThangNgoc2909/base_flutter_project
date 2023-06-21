import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../base/base_cubit/mixin/log_mixin.dart';
import '../common/constants/constants.dart';

@LazySingleton()
class AppPreferences with LogMixin {
  AppPreferences(this._sharedPreference);

  final SharedPreferences _sharedPreference;

  String get deviceToken {
    return _sharedPreference.getString(PrefKeys.deviceToken) ?? '';
  }

  bool get isFirstLogin =>
      _sharedPreference.getBool(PrefKeys.isFirstLogin) ?? true;

  bool get isFirstLaunchApp =>
      _sharedPreference.getBool(PrefKeys.isFirstLaunchApp) ?? true;

  String? get accessToken {
    return _sharedPreference.getString(PrefKeys.accessToken);
  }

  String? get refreshToken {
    return _sharedPreference.getString(PrefKeys.refreshToken);
  }

  bool get isLoggedIn {
    final token = _sharedPreference.getString(PrefKeys.accessToken) ?? '';

    return token.isNotEmpty;
  }

  Future<bool> saveIsFirstLogin(bool isFirstLogin) {
    return _sharedPreference.setBool(PrefKeys.isFirstLogin, isFirstLogin);
  }

  Future<bool> saveIsFirsLaunchApp(bool isFirstLaunchApp) {
    return _sharedPreference.setBool(
        PrefKeys.isFirstLaunchApp, isFirstLaunchApp);
  }

  Future<bool> saveAccessToken(String token) async {
    final success = await _sharedPreference.setString(
      PrefKeys.accessToken,
      token,
    );

    return success;
  }

  Future<bool> saveRefreshToken(String token) async {
    final success = await _sharedPreference.setString(
      PrefKeys.refreshToken,
      token,
    );
    return success;
  }

  Future<bool> saveIsDarkMode(bool isDarkMode) {
    return _sharedPreference.setBool(PrefKeys.isDarkMode, isDarkMode);
  }

  Future<bool> saveDeviceToken(String token) {
    return _sharedPreference.setString(PrefKeys.deviceToken, token);
  }

  Future<void> clearCurrentUserData() async {
    await Future.wait(
      [
        _sharedPreference.remove(PrefKeys.currentUser),
        _sharedPreference.remove(PrefKeys.accessToken),
        _sharedPreference.remove(PrefKeys.refreshToken),
      ],
    );
  }
}
