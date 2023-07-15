import 'package:fidibo_paper/constants.dart';
import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    primaryColor: Colors.blue,
    fontFamily: FONT_IRAN_SANS,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      bodyMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
      bodySmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 10, color: Colors.black),
      titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
      titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
      titleSmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 10, color: Colors.white),
      displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      displayMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
      displaySmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 10, color: Colors.black),
      headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
      headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
      headlineSmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 10, color: Colors.white),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black87),
    cardTheme: const CardTheme(
      shadowColor: Color(0xff8899f8),
      elevation: 17,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
    ),
  );
}
