import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

enum AppBadgeVariant { online, notification, dot }

class AppBadge extends StatelessWidget {
  final AppBadgeVariant variant;
  final double size;
  final Color? color;

  const AppBadge({
    super.key,
    this.variant = AppBadgeVariant.online,
    this.size = 12.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    final badgeColor = color ?? (variant == AppBadgeVariant.online 
        ? const Color(0xFF10B981) 
        : AppColors.pointOrange);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: badgeColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: isDark ? AppColors.darkBackground : AppColors.lightSurface,
          width: 2,
        ),
      ),
    );
  }
}
