class AppDimensions {
  // Tailwind Spacing Scale
  static const double s1 = 4.0;
  static const double s2 = 8.0;
  static const double s3 = 12.0;
  static const double s4 = 16.0;
  static const double s5 = 20.0;
  static const double s6 = 24.0;
  static const double s8 = 32.0;
  static const double s10 = 40.0;
  static const double s12 = 48.0;
  static const double s16 = 64.0;
  static const double s20 = 80.0;
  static const double s24 = 96.0;
  
  // --- 표준 컴포넌트 규격 (Standard System) ---
  
  // 1. 컴포넌트 높이 (Component Heights)
  static const double componentHeight = 40.0; // 기본 버튼, 입력창 높이
  static const double componentHeightDense = 32.0; 
  
  // 2. 내부 여백 (Internal Padding)
  static const double paddingHorizontal = 12.0;
  static const double paddingVertical = 9.0; // (40 - 22) / 2 가량의 텍스트 수직 중앙 정렬값
  
  // 3. 요소 간 간격 (Inter-element Spacing)
  static const double gapTitle = 4.0;
  static const double gapDescription = 8.0;
  static const double gapField = 16.0;
  static const double gapSection = 40.0;

  // 4. 입력창 너비 (Input Widths)
  static const double inputWidthStandard = 320.0;
  
  // Tailwind Border Radius
  static const double radiusSm = 2.0;
  static const double radiusMd = 6.0;
  static const double radiusLg = 8.0;
  static const double radiusFull = 9999.0;

  // Backward compatibility
  static const double radiusMedium = radiusMd;
  
  // 레이아웃
  static const double contentMaxWidth = 1200.0;
}
