import 'package:shared_preferences/shared_preferences.dart';

class SettingsData {
  final bool themeMode;
  final String langCode;
  final String userName;
  const SettingsData(this.themeMode, this.langCode, this.userName);
}

class GAISharedPreferences {
  static late SharedPreferences _preferences;

  static const _keyThemeMode = 'ThemeMode';
  static const _keyLangCode = 'LangCode';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setThemeMode(bool ThemeMode) async =>
      await _preferences.setBool(_keyThemeMode, ThemeMode);

  static bool getThemeMode() {
    bool? theme = _preferences.getBool(_keyThemeMode);
    if (theme == null) {
      //TODO: take care of storing default values while registering the app first time
      return false;
    }
    return theme;
  }

  static Future setLangCode(String LangCode) async =>
      await _preferences.setString(_keyLangCode, LangCode);

  static String getLangCode() {
    String? lang = _preferences.getString(_keyLangCode);
    if (lang == null) {
      //TODO: take care of storing default values while registering the app first time
      return 'en';
    }
    return lang;
  }

  static SettingsData getSettingsData() {
    return SettingsData(getThemeMode(), getLangCode(), 'userName');
  }
}
