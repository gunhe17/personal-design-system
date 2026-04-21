import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../../core/app_typography.dart';

class AppInactivePlaceholder extends StatelessWidget {
  final String? text;
  final IconData icon;
  final EdgeInsetsGeometry padding;

  const AppInactivePlaceholder({
    super.key,
    this.text = 'Deactivated',
    this.icon = Icons.lock_outline,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.gray900 : AppColors.gray50;
    final border = isDark ? AppColors.gray800 : AppColors.gray200;
    const fg = AppColors.gray500;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: border, style: BorderStyle.solid),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 14, color: fg),
          if (text != null) ...[
            const SizedBox(width: 6),
            Text(
              text!,
              style: AppTypography.labelSmall.copyWith(
                color: fg,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
