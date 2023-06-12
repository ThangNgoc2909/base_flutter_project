abstract class MyAppRepo {
  bool get isLoggedIn;

  bool get isFirstLaunchApp;

  bool get isFirstLogin;

  bool get isDarkMode;

  Stream<bool> get onConnectivityChanged;

  Future<void> login(String email, String password);

  Future<void> logout();

  Future<void> forgotPassword(String email);

  Future<void> clearCurrentUserData();

  Future<bool> saveDeviceToken(String deviceToken);

  Future<bool> saveIsFirstLogin(bool isFirstLogin);

  Future<bool> saveIsFirstLaunchApp(bool isFirstLaunchApp);

  Future<bool> saveIsDarkMode(bool isDarkMode);

  int deleteAllUsersAndImageUrls();
}
