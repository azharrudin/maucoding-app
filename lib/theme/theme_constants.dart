import 'package:flutter/material.dart';

final COLOR_1 = Colors.amber.shade300;
final COLOR_2 = Colors.lightGreen.shade300;
final COLOR_3 = Colors.lightBlue.shade300;
final COLOR_4 = Colors.orange.shade300;
final COLOR_5 = Colors.pinkAccent.shade100;
final COLOR_6 = Colors.tealAccent.shade100;
final COLOR_7 = Colors.indigo.shade300;
final COLOR_8 = Colors.purpleAccent.shade100;

const COLOR_TEXT2_LIGHT = Color(0xff141B29);
const COLOR_TEXT_LIGHT = Color(0xff110D0E);

const COLOR_TEXT_DARK = Color(0xffFEFDFF);
const COLOR_TEXT2_DARK = Color(0xffFBFAED);

const COLOR_BACK_LIGHT = Color.fromARGB(255, 255, 255, 255);
const COLOR_BACK_DARK = Color.fromARGB(255, 18, 18, 18);

const COLOR_FORE_LIGHT = Color.fromARGB(255, 255, 255, 255);
const COLOR_FORE_DARK = Color.fromARGB(255, 18, 18, 18);

const COLOR_HIGH_BOTH = Color(0xff6aa6ff);
const COLOR_BACK_BOTH = Color(0xffD0B0FF);
const COLOR_MUTED_BOTH = Color(0xffB6B7BF);
const COLOR_ACCENT_BOTH = Color(0xff8262F7);
ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // canvasColor: COLOR_CANVAS_LIGHT,
    // primaryColor: COLOR_PRIMARY_LIGHT,
    colorScheme: ColorScheme.light(
        primary: COLOR_ACCENT_BOTH,
        secondary: COLOR_MUTED_BOTH,
        surface: COLOR_FORE_LIGHT),
    iconTheme: IconThemeData(color: COLOR_ACCENT_BOTH),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            color: COLOR_TEXT_LIGHT,
            fontWeight: FontWeight.bold,
            fontSize: 20.0),
        bodyText2: TextStyle(color: COLOR_TEXT2_LIGHT, fontSize: 10),
        headline1: TextStyle(
            color: COLOR_TEXT_LIGHT,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
        headline2: TextStyle(color: COLOR_TEXT2_LIGHT, fontSize: 18.0),
        headline3: TextStyle(
            color: COLOR_TEXT_LIGHT,
            fontWeight: FontWeight.bold,
            fontSize: 24.0),
        headline4: TextStyle(color: COLOR_TEXT2_LIGHT, fontSize: 12.0),
        headline5: TextStyle(
            color: COLOR_TEXT_LIGHT,
            fontWeight: FontWeight.bold,
            fontSize: 20.0)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: COLOR_ACCENT_BOTH, foregroundColor: COLOR_TEXT_LIGHT));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    canvasColor: COLOR_BACK_DARK,
    // primaryColor: COLOR_MUTED_TEXT_LIGHT,
    iconTheme: IconThemeData(color: COLOR_ACCENT_BOTH),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            color: COLOR_TEXT_DARK,
            fontWeight: FontWeight.bold,
            fontSize: 20.0),
        bodyText2: TextStyle(color: COLOR_TEXT2_DARK, fontSize: 10),
        headline1: TextStyle(
            color: COLOR_TEXT_DARK,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
        headline2: TextStyle(color: COLOR_TEXT2_DARK, fontSize: 18.0),
        headline3: TextStyle(
            color: COLOR_TEXT_DARK,
            fontWeight: FontWeight.bold,
            fontSize: 24.0),
        headline4: TextStyle(color: COLOR_TEXT2_DARK, fontSize: 12.0),
        headline5: TextStyle(
            color: COLOR_TEXT_DARK,
            fontWeight: FontWeight.bold,
            fontSize: 20.0)),
    colorScheme: ColorScheme.dark(
        primary: COLOR_ACCENT_BOTH,
        secondary: COLOR_MUTED_BOTH,
        surface: COLOR_FORE_DARK),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: COLOR_ACCENT_BOTH, foregroundColor: COLOR_TEXT_DARK));
