import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    background: Color(0xFFF8F9FA),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF505458),
    primary: Color(0xFF5C6BC0), // Indigo shade
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFE8EAF6), // Light indigo for containers
    onPrimaryContainer: Color(0xFF3949AB),
    secondary: Color(0xFF26A69A), // Teal accent
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE0F2F1),
    onSecondaryContainer: Color(0xFF00796B),
    tertiary: Color(0xFF000E40), // Deep orange accent
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFE0B2),
    onTertiaryContainer: Color(0xFFE65100),
    inversePrimary: Color(0xFF3949AB), // Darker indigo
    error: Colors.redAccent,
    shadow: Colors.black.withOpacity(0.1),
  ),

  // Button theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
    ),
  ),

  // Input decoration
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0xFFE0E0E0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0xFFE0E0E0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0xFF5C6BC0), width: 2),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  ),

  scaffoldBackgroundColor: Color(0xFFF8F9FA),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFFF0000),
    foregroundColor: Colors.white,
    elevation: 0,
  ),

  // General text theme
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: Color(0xFF303030),
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      color: Color(0xFF303030),
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(color: Color(0xFF505458)),
    bodyMedium: TextStyle(color: Color(0xFF505458)),
  ),
);
