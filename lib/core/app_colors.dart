import 'package:flutter/material.dart';

class AppColors {
  // Point Gradient (Accent)
  static const List<Color> pointGradient = [
    Color(0xFFF94001), 
    Color(0xFFED9D0B)
  ];

  // Light Mode Colors (Achromatic)
  static const Color lightPrimary = Color(0xFF18181B); // Zinc-900
  static const Color lightBackground = Color(0xFFFAFAFA); // Zinc-50
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOutline = Color(0xFFE4E4E7); // Zinc-200
  static const Color lightSecondary = Color(0xFF71717A); // Zinc-500

  // Dark Mode Colors (Achromatic)
  static const Color darkPrimary = Color(0xFFFAFAFA); // Zinc-50
  static const Color darkBackground = Color(0xFF09090B); // Zinc-950
  static const Color darkSurface = Color(0xFF18181B); // Zinc-900
  static const Color darkOutline = Color(0xFF27272A); // Zinc-800
  static const Color darkSecondary = Color(0xFFA1A1AA); // Zinc-400

  // Semantic Color Schemes
  static ColorScheme lightScheme() => const ColorScheme.light(
    primary: lightPrimary,
    onPrimary: Colors.white,
    secondary: lightSecondary,
    onSecondary: Colors.white,
    surface: lightSurface,
    onSurface: lightPrimary,
    outline: lightOutline,
    error: Color(0xFFEF4444),
  );

  static ColorScheme darkScheme() => const ColorScheme.dark(
    primary: darkPrimary,
    onPrimary: Color(0xFF18181B),
    secondary: darkSecondary,
    onSecondary: Color(0xFF18181B),
    surface: darkSurface,
    onSurface: darkPrimary,
    outline: darkOutline,
    error: Color(0xFFEF4444),
  );

  static List<BoxShadow> elevation(int level, bool isDark) {
    if (level <= 0) return [];
    return [
      BoxShadow(
        color: (isDark ? Colors.black : Colors.black).withValues(alpha: isDark ? 0.3 : 0.05 + (level * 0.02)),
        blurRadius: level * 4.0,
        offset: Offset(0, level * 2.0),
      ),
    ];
  }

  static const List<Color> palette = [
    Color(0xFF09090B), Color(0xFF18181B), Color(0xFF3F3F46), 
    Color(0xFFA1A1AA), Color(0xFFE4E4E7), Color(0xFFFAFAFA)
  ];
}
