import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String? getString(String key, {String? defaultValue}) {
    final value = _preferences.getString(key);
    return value != null && value.isNotEmpty ? value : defaultValue;
  }

  static Future<void> setString(String key, String? value) async {
    await _preferences.setString(
        key, value ?? ''); // Use uma string vazia se o valor for nulo
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return _preferences.getBool(key) ?? defaultValue;
  }

  static Future<void> setBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }
}
