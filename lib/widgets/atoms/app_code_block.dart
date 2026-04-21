import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../../core/app_typography.dart';
import 'app_surface.dart';

class AppCodeBlock extends StatelessWidget {
  final String text;
  final int? maxLines;
  final String? language;
  final TextStyle? textStyle;

  const AppCodeBlock({
    super.key,
    required this.text,
    this.maxLines,
    this.language,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultStyle = AppTypography.labelSmall.copyWith(
      fontFamily: 'monospace',
      fontFamilyFallback: const ['Menlo', 'Courier', 'monospace'],
      color: isDark ? AppColors.gray200 : AppColors.gray800,
      height: 1.5,
      fontSize: 12,
    );

    return AppSurface(
      color: isDark ? AppColors.gray950 : AppColors.gray50,
      padding: const EdgeInsets.all(12),
      borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (language != null) ...[
            Text(
              language!,
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.gray500,
                fontSize: 10,
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
          ],
          SelectableText(
            text,
            maxLines: maxLines,
            style: textStyle ?? defaultStyle,
          ),
        ],
      ),
    );
  }
}
