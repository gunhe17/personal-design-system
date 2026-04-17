import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
enum AppSectionHeaderVariant { category, item, section }

class AppSectionHeader extends StatelessWidget {
  final String title;
  final String? description;
  final AppSectionHeaderVariant variant;

  const AppSectionHeader({
    super.key,
    required this.title,
    this.description,
    this.variant = AppSectionHeaderVariant.category,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (variant == AppSectionHeaderVariant.section) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title, 
            style: AppTypography.titleLarge.copyWith(
              color: isDark ? Colors.white : AppColors.gray900, 
              fontWeight: FontWeight.w800,
            ),
          ),
          if (description != null) ...[
            const SizedBox(height: 4),
            Text(
              description!, 
              style: AppTypography.bodySmall.copyWith(color: AppColors.gray500),
            ),
          ],
          const SizedBox(height: 16),
          Divider(color: isDark ? AppColors.gray800 : AppColors.gray200, height: 1),
        ],
      );
    }

    if (variant == AppSectionHeaderVariant.item) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title, 
            style: AppTypography.titleMedium.copyWith(
              color: colorScheme.onSurface, 
              fontWeight: FontWeight.bold,
            ),
          ),
          if (description != null) ...[
            const SizedBox(height: 2),
            Text(
              description!, 
              style: AppTypography.labelSmall.copyWith(
                color: colorScheme.secondary.withValues(alpha: 0.6), 
                fontSize: 10, 
                letterSpacing: 1.0, 
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4, 
              height: 24, 
              decoration: BoxDecoration(
                color: AppColors.pointOrange,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title.toUpperCase(), 
              style: AppTypography.headlineSmall.copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),
        if (description != null) ...[
          const SizedBox(height: 12),
          Text(
            description!, 
            style: AppTypography.bodySmall.copyWith(color: colorScheme.secondary),
          ),
        ],
        const SizedBox(height: 24),
        Divider(color: colorScheme.outline, thickness: 1.5),
      ],
    );
  }
}
