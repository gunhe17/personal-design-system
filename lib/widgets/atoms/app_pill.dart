import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../../core/app_typography.dart';

class AppPill extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;

  const AppPill({
    super.key,
    required this.text,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color ?? AppColors.pointOrange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      ),
      child: Text(
        text, 
        style: AppTypography.labelSmall.copyWith(
          color: textColor ?? AppColors.pointOrange, 
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
