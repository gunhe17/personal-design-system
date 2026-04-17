import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_dimensions.dart';
import '../core/app_typography.dart';

class AppFrame extends StatelessWidget {
  final String title;
  final Widget child;
  final double? height;

  const AppFrame({
    super.key,
    required this.title,
    required this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppDimensions.s8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        boxShadow: AppColors.elevation(1, isDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Browser-like Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isDark ? AppColors.gray900 : AppColors.gray100,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(AppDimensions.radiusLg)),
              border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.outline)),
            ),
            child: Row(
              children: [
                const Row(
                  children: [
                    CircleAvatar(radius: 5, backgroundColor: AppColors.pointOrange),
                    SizedBox(width: 6),
                    CircleAvatar(radius: 5, backgroundColor: AppColors.pointGold),
                    SizedBox(width: 6),
                    CircleAvatar(radius: 5, backgroundColor: AppColors.gray400),
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.gray950 : Colors.white,
                      borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                      border: Border.all(color: Theme.of(context).colorScheme.outline),
                    ),
                    child: Text(
                      'example.design/$title',
                      style: AppTypography.labelSmall.copyWith(
                        fontSize: 10,
                        color: AppColors.gray500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 80), // Spacer for balance
              ],
            ),
          ),
          // Content
          ClipRect(
            child: SizedBox(
              height: height,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
