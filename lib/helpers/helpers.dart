import 'package:shared_preferences/shared_preferences.dart';

class StorageKeys {
  static const token = "TOKEN";
  static const refresh = "REFRESH";
  static const user = "USER";
  static const theme = 'THEME';
}

class StorageHelper {
  static SharedPreferences? _prefs;

  static Future<dynamic> _getInstance() async =>
      _prefs = await SharedPreferences.getInstance();

  static Future<String?> get(String key) async {
    await _getInstance();
    return _prefs!.getString(key);
  }

  static Future<bool> getBool(String key) async {
    await _getInstance();
    return _prefs!.getBool(key) == true;
  }

  static Future<bool> setBool(String key, bool value) async {
    await _getInstance();
    return _prefs!.setBool(key, value);
  }

  static Future<void> set(String key, dynamic value) async {
    await _getInstance();
    _prefs!.setString(key, value);
  }

  static Future<void> remove(String key) async {
    await _getInstance();
    _prefs!.remove(key);
  }

  static Future<void> logout() async {
    await _getInstance();
    await _prefs!.remove(StorageKeys.token);
    await _prefs!.remove(StorageKeys.refresh);
    await _prefs!.remove(StorageKeys.user);
  }
}
