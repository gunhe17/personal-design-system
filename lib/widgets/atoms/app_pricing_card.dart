import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../../core/app_dimensions.dart';
import 'app_button.dart';
import 'app_surface.dart';

class AppPricingCard extends StatelessWidget {
  final String tier;
  final String price;
  final String period;
  final String description;
  final List<String> features;
  final String buttonText;
  final bool isEmphasized;
  final VoidCallback? onPressed;

  const AppPricingCard({
    super.key,
    required this.tier,
    required this.price,
    required this.period,
    required this.description,
    required this.features,
    required this.buttonText,
    this.isEmphasized = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppSurface(
      color: isEmphasized 
          ? (isDark ? AppColors.gray800 : AppColors.gray900)
          : (isDark ? Colors.white.withValues(alpha: 0.02) : Colors.white),
      padding: const EdgeInsets.all(32),
      borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tier,
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.pointOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                price,
                style: AppTypography.displayLarge.copyWith(
                  color: isDark || isEmphasized ? Colors.white : AppColors.gray900,
                  fontSize: 40,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                period,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.gray500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: AppTypography.bodySmall.copyWith(
              color: isDark || isEmphasized ? AppColors.gray300 : AppColors.gray600,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          ...features.map((feature) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                const Icon(Icons.check, color: AppColors.pointOrange, size: 18),
                const SizedBox(width: 12),
                Text(
                  feature,
                  style: AppTypography.bodySmall.copyWith(
                    color: isDark || isEmphasized ? AppColors.gray300 : AppColors.gray700,
                  ),
                ),
              ],
            ),
          )),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: AppButton(
              text: buttonText,
              variant: isEmphasized ? AppButtonVariant.primary : AppButtonVariant.secondary,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
