import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../../core/app_typography.dart';
import 'app_avatar.dart';
import 'app_pill.dart';

class AppBlogCard extends StatelessWidget {
  final String date;
  final String category;
  final String title;
  final String description;
  final String authorName;
  final String authorRole;
  final String? authorImageUrl;
  final VoidCallback? onTap;

  const AppBlogCard({
    super.key,
    required this.date,
    required this.category,
    required this.title,
    required this.description,
    required this.authorName,
    required this.authorRole,
    this.authorImageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 01. Metadata (Date & Category)
          Row(
            children: [
              Text(
                date,
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.gray500,
                  fontSize: 11,
                ),
              ),
              const SizedBox(width: 12),
              AppPill(
                text: category,
                color: isDark ? Colors.white.withValues(alpha: 0.05) : AppColors.gray100,
                textColor: isDark ? AppColors.gray300 : AppColors.gray700,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 02. Content
          Text(
            title,
            style: AppTypography.titleMedium.copyWith(
              color: isDark ? Colors.white : AppColors.gray900,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.gray500,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 32),
          // 03. Author
          Row(
            children: [
              AppAvatar(imageUrl: authorImageUrl, size: 40),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authorName,
                      style: AppTypography.labelSmall.copyWith(
                        color: isDark ? Colors.white : AppColors.gray900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      authorRole,
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.gray500,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
