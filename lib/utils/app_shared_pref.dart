import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  static final _sectionName = "section_name";

  static SharedPreferences _sharedPreferences;

  static Future setInstance() async {
    if (null != _sharedPreferences) return;
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setSectionName(String value) => _sharedPreferences.setString(_sectionName, value);
  static String getSectionName() => _sharedPreferences.getString(_sectionName) ?? "";
}