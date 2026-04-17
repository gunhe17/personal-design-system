import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../../core/app_typography.dart';
import '../../core/app_animations.dart';

enum AppSelectTriggerVariant { select, dropdown }

class AppSelectTrigger extends StatelessWidget {
  final String text;
  final String? imageUrl;
  final bool isOpen;
  final VoidCallback onTap;
  final AppSelectTriggerVariant variant;
  final bool expand;

  const AppSelectTrigger({
    super.key,
    required this.text,
    this.imageUrl,
    required this.isOpen,
    required this.onTap,
    this.variant = AppSelectTriggerVariant.select,
    this.expand = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;
    final isDropdown = variant == AppSelectTriggerVariant.dropdown;

    final bgColor = isDropdown
        ? (isDark ? AppColors.gray800 : AppColors.gray100)
        : (isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white);

    final textStyle = isDropdown
        ? AppTypography.labelMedium.copyWith(
            color: isDark ? Colors.white : AppColors.gray900,
            fontWeight: FontWeight.w600,
          )
        : AppTypography.bodySmall.copyWith(
            color: isDark ? Colors.white : AppColors.gray900,
          );

    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        splashColor: AppAnimations.splashColor(context),
        splashFactory: AppAnimations.splashFactory,
        highlightColor: Colors.transparent,
        child: AnimatedContainer(
          duration: AppAnimations.fast,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: isOpen ? AppColors.gray400 : colorScheme.outline,
              width: isOpen ? 1.5 : 1,
            ),
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          ),
          child: Row(
            mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (imageUrl != null) ...[
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(imageUrl!),
                ),
                const SizedBox(width: 12),
              ],
              if (expand)
                Expanded(child: Text(text, style: textStyle))
              else
                Text(text, style: textStyle),
              const SizedBox(width: 6),
              AnimatedRotation(
                turns: isOpen ? 0.5 : 0,
                duration: AppAnimations.fast,
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: AppColors.gray400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
