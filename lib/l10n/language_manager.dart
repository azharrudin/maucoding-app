import 'package:flutter/material.dart';
import 'package:greetings_ai/models/settings/languages.dart';

class LanguageManager with ChangeNotifier {
  static final LanguageManager _LanguageManager = LanguageManager._internal();

  factory LanguageManager() {
    return _LanguageManager;
  }
  LanguageManager._internal();

  static Locale _currentLangCode =
      Locale(LangCodePair[LangCodePair.keys.first]!);
  Locale get currentLanguage => _currentLangCode;

  updateLanguage(Locale langCode) {
    if (langCode != _currentLangCode) {
      _currentLangCode = langCode;
      notifyListeners();
    }
  }
}
