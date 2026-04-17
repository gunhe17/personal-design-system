import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../atoms/app_surface.dart';

class AppImagePlaceholder extends StatelessWidget {
  final IconData icon;
  final double aspectRatio;
  final bool hasShadow;
  final BorderRadius? borderRadius;
  final List<Color>? gradientColors;
  final Color? iconColor;

  const AppImagePlaceholder({
    super.key,
    required this.icon,
    this.aspectRatio = 16 / 10,
    this.hasShadow = false,
    this.borderRadius,
    this.gradientColors,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final resolvedRadius = borderRadius ?? BorderRadius.circular(AppDimensions.radiusLg);

    final colors = gradientColors ??
        (isDark
            ? [AppColors.gray800, AppColors.gray900]
            : [AppColors.gray100, AppColors.gray200]);

    final resolvedIconColor = iconColor ??
        (isDark ? AppColors.gray700 : AppColors.gray300);

    final content = AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
        ),
        child: Center(
          child: Icon(icon, size: 48, color: resolvedIconColor),
        ),
      ),
    );

    if (hasShadow) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: resolvedRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: resolvedRadius,
          child: content,
        ),
      );
    }

    return AppSurface(
      padding: EdgeInsets.zero,
      borderRadius: resolvedRadius,
      child: content,
    );
  }
}
