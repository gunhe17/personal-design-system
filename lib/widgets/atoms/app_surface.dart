import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';

class AppSurface extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final bool showBorder;
  final Color? color;

  const AppSurface({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.showBorder = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AppColors.gray800 : AppColors.gray200;

    return Container(
      padding: padding,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: color ?? (isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white),
        borderRadius: borderRadius ?? BorderRadius.circular(AppDimensions.radiusMd),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
