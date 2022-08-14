import 'package:greetings_ai/database/greetings_ai_shared_pref.dart';
import 'package:greetings_ai/models/settings/languages.dart';
import 'package:greetings_ai/theme/theme_manager.dart';
import 'package:greetings_ai/l10n/language_manager.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

ThemeManager _themeManager = ThemeManager();
LanguageManager _langManager = LanguageManager();

class Settings extends StatefulWidget {
  //const NoteContainer({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late SettingsData settingsData;
  bool isLoading = false;

  bool darkMode = _themeManager.themeMode == ThemeMode.dark ? true : false;
  String langCode = _langManager.currentLanguage.languageCode;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    getSettingsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: isLoading
          ? CircularProgressIndicator()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.dark_mode_outlined,
                          size: 35,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.darktheme,
                              style: _textTheme.headline5,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Switch.adaptive(
                            activeColor: Theme.of(context).colorScheme.primary,
                            value: darkMode,
                            onChanged: onThemeSwitch),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                ),
                InkWell(
                  onTap: () {
                    onLanguageSelectDialog(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.language_outlined,
                            size: 35,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.language,
                                style: _textTheme.headline5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Text(
                                  LangCodePair[langCode]!,
                                  style: _textTheme.bodyText2,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                ),
              ],
            ),
    );
  }

  onLanguageSelectDialog(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Choose a language',
              style: _textTheme.headline5,
            ),
            content: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: LangCodePair.entries
                        .map((e) => RadioListTile(
                            activeColor: Theme.of(context).colorScheme.primary,
                            // selectedTileColor: Theme.of(context).primaryColor,
                            title: Text(e.value, style: _textTheme.headline2),
                            value: e.key,
                            // selected: _langManager.currentLanguage == 'en',
                            groupValue:
                                _langManager.currentLanguage.languageCode,
                            onChanged: (value) {
                              onLanguageSelect(value.toString());
                            }))
                        .toList()

                    // Languages.map((e) => RadioListTile(
                    //     activeColor: Theme.of(context).colorScheme.primary,
                    //     // selectedTileColor: Theme.of(context).primaryColor,
                    //     title: Text(e.name, style: _textTheme.headline2),
                    //     value: e.code,
                    //     // selected: _langManager.currentLanguage == 'en',
                    //     groupValue: _langManager.currentLanguage.languageCode,
                    //     onChanged: (value) {
                    //       onLanguageSelect(value.toString());
                    //     })).toList(),
                    ),
              ),
            ),
          );
        });
  }

  onLanguageSelect(String langCode) async {
    setState(() {
      this.langCode = langCode;
    });
    _langManager.updateLanguage(Locale(langCode));

    await GAISharedPreferences.setLangCode(langCode);
    Navigator.of(context).pop();
  }

  onThemeSwitch(bool isDark) async {
    setState(() {
      darkMode = isDark;
    });
    _themeManager.toggleTheme(isDark);
    await GAISharedPreferences.setThemeMode(isDark);
  }

  Future getSettingsData() async {
    setState(() {
      isLoading = true;
    });
    this.settingsData = GAISharedPreferences.getSettingsData();
    setState(() {
      isLoading = false;
    });
  }
}
