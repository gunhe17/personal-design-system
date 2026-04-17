import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';

class AppStatItem extends StatelessWidget {
  final String label;
  final String value;

  const AppStatItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: AppTypography.displayLarge.copyWith(
            color: isDark ? Colors.white : AppColors.gray900,
            fontSize: 36,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.0,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.gray500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
