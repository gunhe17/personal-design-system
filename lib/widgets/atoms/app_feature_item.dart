import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import 'app_icon_box.dart';

class AppFeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const AppFeatureItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon Container
        AppIconBox(icon: icon),
        const SizedBox(width: 16),
        // Text Content
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
