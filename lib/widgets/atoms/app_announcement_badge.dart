import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../../core/app_typography.dart';
import 'app_surface.dart';

class AppAnnouncementBadge extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback? onTap;

  const AppAnnouncementBadge({
    super.key,
    required this.text,
    required this.actionText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppSurface(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: AppTypography.labelSmall.copyWith(color: AppColors.gray500),
            ),
            const SizedBox(width: 8),
            Text(
              actionText,
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.pointOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
