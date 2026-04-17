import 'package:flutter/material.dart';

class AppTypography {
  static const String pretendard = 'Pretendard';

  // Using system default for English and Pretendard for Korean fallback
  static const List<String> fontFamilyFallback = [pretendard];

  static const TextStyle displayLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    height: 1.2,
    fontFamilyFallback: fontFamilyFallback,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.2,
    fontFamilyFallback: fontFamilyFallback,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.2,
    fontFamilyFallback: fontFamilyFallback,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.5,
    fontFamilyFallback: fontFamilyFallback,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    fontFamilyFallback: fontFamilyFallback,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 1.5,
    fontFamilyFallback: fontFamilyFallback,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    fontFamilyFallback: fontFamilyFallback,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 1.5,
    fontFamilyFallback: fontFamilyFallback,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
    fontFamilyFallback: fontFamilyFallback,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.6,
    fontFamilyFallback: fontFamilyFallback,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.6,
    fontFamilyFallback: fontFamilyFallback,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
    fontFamilyFallback: fontFamilyFallback,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
    fontFamilyFallback: fontFamilyFallback,
  );
}
