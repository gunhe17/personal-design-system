import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../../core/app_typography.dart';
import '../../core/app_animations.dart';

class AppPaginationItem extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final bool isActive;
  final bool isFirst;
  final bool isLast;
  final VoidCallback? onTap;

  const AppPaginationItem({
    super.key,
    this.text,
    this.icon,
    this.isActive = false,
    this.isFirst = false,
    this.isLast = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // 스타일 결정
    final backgroundColor = isActive 
        ? AppColors.pointOrange 
        : Colors.transparent;
    
    final textColor = isActive 
        ? Colors.white 
        : (isDark ? AppColors.gray300 : AppColors.gray700);

    final borderColor = isDark ? AppColors.gray800 : AppColors.gray300;

    final borderRadius = BorderRadius.horizontal(
      left: isFirst ? const Radius.circular(AppDimensions.radiusMd) : Radius.zero,
      right: isLast ? const Radius.circular(AppDimensions.radiusMd) : Radius.zero,
    );

    return Material(
      color: backgroundColor,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        splashColor: AppAnimations.splashColor(context),
        splashFactory: AppAnimations.splashFactory,
        child: Container(
          height: AppDimensions.componentHeight,
          constraints: const BoxConstraints(minWidth: 40),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 0.5),
            borderRadius: borderRadius,
          ),
          alignment: const Alignment(0, -0.1),
          child: icon ?? Text(
            text ?? '',
            style: AppTypography.labelMedium.copyWith(
              color: textColor,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
