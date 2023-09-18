import 'package:flutter/material.dart';
import 'package:greetings_ai/database/greetings_ai_shared_pref.dart';
import 'package:greetings_ai/l10n/l10n.dart';
import 'package:greetings_ai/l10n/language_manager.dart';
import 'package:greetings_ai/screens/home/home_screen.dart';
import 'package:greetings_ai/screens/people/people_list.dart';
import 'package:greetings_ai/screens/settings/settings.dart';
import 'package:greetings_ai/theme/theme_constants.dart';
import 'package:greetings_ai/theme/theme_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:greetings_ai/utils/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GAISharedPreferences.init();
  runApp(const GreetingApp());
}

ThemeManager _themeManager = ThemeManager();
LanguageManager _languageManager = LanguageManager();

class GreetingApp extends StatefulWidget {
  const GreetingApp({Key? key}) : super(key: key);

  @override
  State<GreetingApp> createState() => _GreetingAppState();
}

class _GreetingAppState extends State<GreetingApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    _languageManager.removeListener(languageListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    _themeManager.toggleTheme(GAISharedPreferences.getThemeMode());
    _languageManager.addListener(languageListener);
    _languageManager.updateLanguage(Locale(GAISharedPreferences.getLangCode()));
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  languageListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greetings.ai',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      supportedLocales: L10n.all,
      locale: _languageManager.currentLanguage,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
    );
  }
}

class ScreenContainer extends StatefulWidget {
  // const ScreenContainer({Key? key}) : super(key: key);
  @override
  State<ScreenContainer> createState() => _ScreenContainerState();
}

class _ScreenContainerState extends State<ScreenContainer> {
  int screenIndex = 0;
  final screens = [People(), Home(), Settings()];
  void onNavigate(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: screens[screenIndex],
        bottomNavigationBar: Container(
            decoration: BoxDecoration(                
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).colorScheme.secondary, spreadRadius: 0, blurRadius: 10),
                ]),
            child: BottomNavigationBar(
                iconSize: 35.0,
                elevation: 3,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                selectedItemColor: Theme.of(context).colorScheme.primary,
                unselectedItemColor: Theme.of(context).colorScheme.secondary,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                currentIndex: screenIndex,
                onTap: onNavigate,
                items: [
                  BottomNavigationBarItem(
                      label: 'Belajar', icon: Icon(Icons.library_books)),
                  BottomNavigationBarItem(
                      label: 'Praktek', icon: Icon(Icons.code)),
                  BottomNavigationBarItem(
                      label: 'Settings', icon: Icon(Icons.settings))
                ])
            //TODO : Fix the navigation bar for iOS
            ));
  }
}
