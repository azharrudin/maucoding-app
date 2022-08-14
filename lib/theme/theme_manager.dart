import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  static final ThemeManager _themeManager = ThemeManager._internal();

  factory ThemeManager() {
    return _themeManager;
  }
  ThemeManager._internal();

  static ThemeMode _themeMode = ThemeMode.dark;
  get themeMode => _themeMode;

  toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
