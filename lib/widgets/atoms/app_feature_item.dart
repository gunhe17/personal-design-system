import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import 'app_icon_box.dart';

enum AppFeatureItemVariant { standard, inline, vertical }

class AppFeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final AppFeatureItemVariant variant;
  final Color? iconBoxColor;
  final Color? iconColor;

  const AppFeatureItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.variant = AppFeatureItemVariant.standard,
    this.iconBoxColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (variant == AppFeatureItemVariant.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIconBox(
            icon: icon,
            size: 40,
            color: iconBoxColor ?? (isDark ? Colors.white.withValues(alpha: 0.05) : AppColors.gray100),
            iconColor: iconColor ?? (isDark ? Colors.white : AppColors.gray900),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTypography.labelMedium.copyWith(
              color: isDark ? Colors.white : AppColors.gray900,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.gray500,
              height: 1.6,
            ),
          ),
        ],
      );
    }

    if (variant == AppFeatureItemVariant.inline) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.pointOrange, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$title ',
                    style: TextStyle(
                      color: isDark ? Colors.white : AppColors.gray900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: description,
                    style: const TextStyle(color: AppColors.gray500),
                  ),
                ],
              ),
              style: AppTypography.bodySmall.copyWith(height: 1.6),
            ),
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppIconBox(icon: icon),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.labelMedium.copyWith(
                  color: isDark ? Colors.white : AppColors.gray900,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.gray500,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
