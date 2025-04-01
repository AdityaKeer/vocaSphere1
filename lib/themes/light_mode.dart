// import 'package:flutter/material.dart';
//
// ThemeData lightMode = ThemeData(
//   colorScheme: ColorScheme.light(
//     surface: Colors.grey.shade300,
//     primary: Colors.grey.shade500,
//     secondary: Colors.grey.shade200,
//     tertiary: Colors.grey.shade100,
//     inversePrimary: Colors.grey.shade900,
//   ),
//   scaffoldBackgroundColor: Colors.grey.shade300,
// );

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
    tertiary: Color(0xFFEF6C00), // Deep orange accent
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
    backgroundColor: Color(0xFF5C6BC0),
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

// import 'package:flutter/material.dart';
//
// ThemeData lightMode = ThemeData(
//   brightness: Brightness.light,
//   useMaterial3: true,
//   colorScheme: ColorScheme.light(
//     background: Color(0xFFF5F7F5), // Soft green-gray
//     surface: Color(0xFFFFFFFF), // White
//     onSurface: Color(0xFF2D3436), // Dark slate gray
//     primary: Color(0xFF228B22), // Forest green
//     onPrimary: Color(0xFFFFFFFF), // White
//     primaryContainer: Color(0xFFD4EDDA), // Light green
//     onPrimaryContainer: Color(0xFF1A5F2A), // Darker green
//     secondary: Color(0xFFFFFFFF), // Royal blue
//     onSecondary: Color(0xFFFFFFFF), // White
//     secondaryContainer: Color(0xFFE6F0FA), // Light blue
//     onSecondaryContainer: Color(0xFF1E3A8A), // Dark blue
//     tertiary: Color(0xFFF4A261), // Warm peach
//     onTertiary: Color(0xFFFFFFFF), // White
//     tertiaryContainer: Color(0xFFFFE8D6), // Light peach
//     onTertiaryContainer: Color(0xFF9F481C), // Dark peach
//     inversePrimary: Color(0xFF1A5F2A), // Darker green
//     error: Colors.redAccent,
//     shadow: Colors.black.withOpacity(0.1),
//   ),
//
//   // Button theme (unchanged structure, uses new colors)
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//     ),
//   ),
//
//   // Input decoration (updated border colors)
//   inputDecorationTheme: InputDecorationTheme(
//     filled: true,
//     fillColor: Colors.white,
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(color: Color(0xFFE2E8F0)), // Slate gray
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(color: Color(0xFFE2E8F0)),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(
//         color: Color(0xFF228B22),
//         width: 2,
//       ), // Forest green
//     ),
//     contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//   ),
//
//   scaffoldBackgroundColor: Color(0xFFF5F7F5), // Matches background
//
//   appBarTheme: AppBarTheme(
//     backgroundColor: Color(0xFF228B22), // Forest green
//     foregroundColor: Colors.white,
//     elevation: 0,
//   ),
//
//   // Text theme (updated colors)
//   textTheme: TextTheme(
//     headlineLarge: TextStyle(
//       color: Color(0xFF2D3436), // Dark slate
//       fontWeight: FontWeight.bold,
//     ),
//     titleLarge: TextStyle(
//       color: Color(0xFF2D3436),
//       fontWeight: FontWeight.w600,
//     ),
//     bodyLarge: TextStyle(color: Color(0xFF2D3436)),
//     bodyMedium: TextStyle(color: Color(0xFF2D3436)),
//   ),
// );

// import 'package:flutter/material.dart';
//
// ThemeData lightMode = ThemeData(
//   brightness: Brightness.light,
//   useMaterial3: true,
//   colorScheme: ColorScheme.light(
//     background: Color(0xFFFDF2F8), // Soft pink
//     surface: Color(0xFFFFFFFF), // White
//     onSurface: Color(0xFF1F2A44), // Dark navy
//     primary: Color(0xFFD81B60), // Vivid pink
//     onPrimary: Color(0xFFFFFFFF), // White
//     primaryContainer: Color(0xFFFDE4EC), // Light pink
//     onPrimaryContainer: Color(0xFF880E4F), // Darker pink
//     secondary: Color(0xFF0288D1), // Bright blue
//     onSecondary: Color(0xFFFFFFFF), // White
//     secondaryContainer: Color(0xFFB3E5FC), // Light blue
//     onSecondaryContainer: Color(0xFF01579B), // Dark blue
//     tertiary: Color(0xFFFFB300), // Amber
//     onTertiary: Color(0xFF212121), // Near-black
//     tertiaryContainer: Color(0xFFFFE082), // Light amber
//     onTertiaryContainer: Color(0xFFBF360C), // Deep orange
//     inversePrimary: Color(0xFF880E4F), // Darker pink
//     error: Colors.redAccent,
//     shadow: Colors.black.withOpacity(0.1),
//   ),
//
//   // Button theme (unchanged structure, uses new colors)
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//     ),
//   ),
//
//   // Input decoration (updated border colors)
//   inputDecorationTheme: InputDecorationTheme(
//     filled: true,
//     fillColor: Colors.white,
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(color: Color(0xFFE0E0E0)), // Light gray
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(color: Color(0xFFE0E0E0)),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(color: Color(0xFFD81B60), width: 2), // Vivid pink
//     ),
//     contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//   ),
//
//   scaffoldBackgroundColor: Color(0xFFFDF2F8), // Matches background
//
//   appBarTheme: AppBarTheme(
//     backgroundColor: Color(0xFFD81B60), // Vivid pink
//     foregroundColor: Colors.white,
//     elevation: 0,
//   ),
//
//   // Text theme (updated colors)
//   textTheme: TextTheme(
//     headlineLarge: TextStyle(
//       color: Color(0xFF1F2A44), // Dark navy
//       fontWeight: FontWeight.bold,
//     ),
//     titleLarge: TextStyle(
//       color: Color(0xFF1F2A44),
//       fontWeight: FontWeight.w600,
//     ),
//     bodyLarge: TextStyle(color: Color(0xFF1F2A44)),
//     bodyMedium: TextStyle(color: Color(0xFF1F2A44)),
//   ),
// );
