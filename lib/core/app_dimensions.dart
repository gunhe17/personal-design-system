class AppDimensions {
  // 베이스 간격 (8px 그리드 시스템)
  static const double s4 = 4.0;
  static const double s8 = 8.0;
  static const double s12 = 12.0;
  static const double s16 = 16.0;
  static const double s24 = 24.0;
  static const double s32 = 32.0;
  static const double s40 = 40.0;
  static const double s48 = 48.0;
  static const double s64 = 64.0;
  
  // --- 표준 컴포넌트 규격 (S / M / L) ---
  // 모든 버튼, FAB, 아바타, 입력창은 이 규격을 따릅니다.
  static const double sizeSmall = 36.0;
  static const double sizeMedium = 44.0;
  static const double sizeLarge = 52.0;

  // 컴포넌트 높이 (규격과 동일하게 유지하여 일관성 확보)
  static const double heightSmall = sizeSmall;
  static const double heightMedium = sizeMedium;
  static const double heightLarge = sizeLarge;

  // 입력창 너비
  static const double inputWidthStandard = 320.0;
  static const double inputWidthNarrow = 160.0;
  
  // 전역 곡률
  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 12.0;
  static const double radiusFull = 100.0;
  
  // 레이아웃
  static const double contentMaxWidth = 800.0;
  static const double sectionSpacing = 80.0;
  static const double itemSpacing = 32.0;
}
