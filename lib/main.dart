import 'package:flutter/material.dart';
import 'pages/showcase_page.dart';
import 'core/app_colors.dart';
import 'core/app_dimensions.dart';
import 'core/app_typography.dart';

void main() {
  runApp(const DesignSystemApp());
}

class DesignSystemApp extends StatelessWidget {
  const DesignSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design System Showcase',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, // 시스템 설정에 따라 다크/라이트 전환
      
      // Light Theme
      theme: _buildTheme(AppColors.lightScheme()),
      
      // Dark Theme
      darkTheme: _buildTheme(AppColors.darkScheme()),
      
      home: const SelectionArea(
        child: ShowcasePage(),
      ),
    );
  }

  ThemeData _buildTheme(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        filled: true,
        fillColor: colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radiusMd)),
      ),
      
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          side: BorderSide(color: colorScheme.outline),
        ),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.primary.withValues(alpha: 0.1),
        iconTheme: WidgetStateProperty.all(IconThemeData(size: 24, color: colorScheme.onSurface)),
        labelTextStyle: WidgetStateProperty.all(AppTypography.labelSmall.copyWith(color: colorScheme.onSurface)),
      ),
    );
  }
}
