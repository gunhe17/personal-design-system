import 'package:flutter/material.dart';

class AppColors {
  // --- Strictly Achromatic Colors (Neutral Gray - No Blue Tint) ---
  static const Color gray50 = Color(0xFFFAFAFA);
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray200 = Color(0xFFE5E5E5);
  static const Color gray300 = Color(0xFFD4D4D4);
  static const Color gray400 = Color(0xFFA3A3A3);
  static const Color gray500 = Color(0xFF737373);
  static const Color gray600 = Color(0xFF525252);
  static const Color gray700 = Color(0xFF404040);
  static const Color gray800 = Color(0xFF262626);
  static const Color gray900 = Color(0xFF171717);
  static const Color gray950 = Color(0xFF0A0A0A);

  // --- Point Colors (Accent) ---
  static const Color pointOrange = Color(0xFFF94001);
  static const Color pointGold = Color(0xFFED9D0B);

  static const List<Color> pointGradient = [
    pointOrange,
    pointGold,
  ];

  // Light Mode Colors
  static const Color lightPrimary = pointOrange; 
  static const Color lightBackground = gray50;
  static const Color lightSurface = Colors.white;
  static const Color lightOutline = gray200;
  static const Color lightSecondary = gray500;

  // Dark Mode Colors
  static const Color darkPrimary = pointOrange;
  static const Color darkBackground = gray950;
  static const Color darkSurface = gray900;
  static const Color darkOutline = gray800;
  static const Color darkSecondary = gray400;

  // Semantic Color Schemes
  static ColorScheme lightScheme() => const ColorScheme.light(
    primary: lightPrimary,
    onPrimary: Colors.white,
    secondary: lightSecondary,
    onSecondary: Colors.white,
    surface: lightSurface,
    onSurface: gray900,
    outline: lightOutline,
    error: Color(0xFFEF4444),
  );

  static ColorScheme darkScheme() => const ColorScheme.dark(
    primary: darkPrimary,
    onPrimary: Colors.white,
    secondary: darkSecondary,
    onSecondary: gray900,
    surface: darkSurface,
    onSurface: gray50,
    outline: darkOutline,
    error: Color(0xFFEF4444),
  );

  static List<BoxShadow> elevation(int level, bool isDark) {
    if (level <= 0) return [];
    return [
      BoxShadow(
        color: Colors.black.withOpacity(isDark ? 0.4 : 0.05 + (level * 0.02)),
        blurRadius: level * 4.0,
        offset: Offset(0, level * 2.0),
      ),
    ];
  }

  static const List<Color> palette = [
    gray950, gray900, gray800, gray700, gray600, gray500, 
    gray400, gray300, gray200, gray100, gray50
  ];
}
