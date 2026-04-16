import 'package:flutter/material.dart';

class AppTypography {
  static const String fontFamily = 'Pretendard';

  // 모든 텍스트의 기준이 되는 평문 크기 (14~16px)
  static const double baseSize = 15.0;

  // Display & Headline (최대 크기를 대폭 축소)
  static const TextStyle displayLarge = TextStyle(fontFamily: fontFamily, fontSize: 32, fontWeight: FontWeight.w700, letterSpacing: -0.5);
  static const TextStyle headlineSmall = TextStyle(fontFamily: fontFamily, fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: -0.2);

  // Title & Body (평문 위주의 구성)
  static const TextStyle titleMedium = TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w700);
  static const TextStyle bodyLarge = TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w400, height: 1.5);
  static const TextStyle bodyMedium = TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w400, height: 1.5);

  // Label (캡션 및 작은 정보)
  static const TextStyle labelLarge = TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w600);
  static const TextStyle labelSmall = TextStyle(fontFamily: fontFamily, fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.5);

  // 나머지 스타일들도 일관성 있게 축소된 크기 제공 (필요 시 호출을 위해 유지)
  static const TextStyle displayMedium = TextStyle(fontFamily: fontFamily, fontSize: 28, fontWeight: FontWeight.w700);
  static const TextStyle displaySmall = TextStyle(fontFamily: fontFamily, fontSize: 24, fontWeight: FontWeight.w700);
  static const TextStyle headlineLarge = TextStyle(fontFamily: fontFamily, fontSize: 22, fontWeight: FontWeight.w700);
  static const TextStyle headlineMedium = TextStyle(fontFamily: fontFamily, fontSize: 20, fontWeight: FontWeight.w700);
  static const TextStyle titleLarge = TextStyle(fontFamily: fontFamily, fontSize: 18, fontWeight: FontWeight.w700);
  static const TextStyle titleSmall = TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w700);
  static const TextStyle bodySmall = TextStyle(fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.w400);
  static const TextStyle labelMedium = TextStyle(fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.w600);
}
