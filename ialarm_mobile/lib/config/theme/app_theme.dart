import 'package:flutter/material.dart';

class AppTheme {
  static ColorScheme get colorScheme {
    return const ColorScheme(
      primary: Color(0xFF083D77),
      secondary: Color(0xFF2E4057),
      surface: Color(0xFFFFFFFF),
      background: Color(0xFFFFFFFF),
      error: Color(0xFFB00020),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF000000),
      onBackground: Color(0xFF000000),
      onError: Color(0xFFFFFFFF),
      brightness: Brightness.light,
    );
  }
  
  static TextTheme get textTheme {
    return const TextTheme(
      headlineLarge: TextStyle(
        // fontSize: 96,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontFamily: 'RobotoFlex'
      ),
      headlineMedium: TextStyle(
        // fontSize: 64,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontFamily: 'RobotoFlex'
      ),
      headlineSmall: TextStyle(
        // fontSize: 48,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: 'RobotoFlex'
      ),
      bodyLarge: TextStyle(
        // fontSize: 32,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: 'RobotoFlex'
      ),
      bodyMedium: TextStyle(
        // fontSize: 24,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: 'RobotoFlex'
      ),
      bodySmall: TextStyle(
        // fontSize: 20,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: 'RobotoFlex'
      ),
    );
  }
  

  static ThemeData get theme {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: textTheme,
    );
  }
}