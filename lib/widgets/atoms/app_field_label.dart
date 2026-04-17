import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';

class AppFieldLabel extends StatelessWidget {
  final String label;

  const AppFieldLabel({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Text(
      label, 
      style: AppTypography.labelMedium.copyWith(
        color: isDark ? Colors.white : AppColors.gray900, 
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
