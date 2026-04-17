import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../../core/app_dimensions.dart';
import '../atoms/app_button.dart';
import '../atoms/app_image_placeholder.dart';
import '../atoms/app_surface.dart';

class AppCtaSection extends StatelessWidget {
  const AppCtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.gray950 : Colors.white,
      ),
      child: AppSurface(
        color: isDark ? AppColors.gray800 : AppColors.gray900,
        padding: const EdgeInsets.fromLTRB(40, 64, 40, 0),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 1024;

            if (isWide) {
              return Row(
                children: [
                  Expanded(child: _buildTextContent(isDark)),
                  const SizedBox(width: 40),
                  Expanded(child: _buildImage(isDark)),
                ],
              );
            }

            return Column(
              children: [
                _buildTextContent(isDark),
                const SizedBox(height: 64),
                _buildImage(isDark),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextContent(bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Boost your productivity.\nStart using our app today.',
            style: AppTypography.headlineLarge.copyWith(
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Ac euismod vel sit maecenas id pellentesque eu sed consectetur. Malesuada adipiscing sagittis vel nulla.',
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.gray300,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              AppButton(
                text: 'Get started',
                variant: AppButtonVariant.secondary,
                onPressed: () {},
              ),
              const SizedBox(width: 24),
              AppButton(
                text: 'Learn more →',
                variant: AppButtonVariant.text,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImage(bool isDark) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: AppImagePlaceholder(
        icon: Icons.dashboard_outlined,
        hasShadow: true,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radiusMd),
        ),
        gradientColors: [
          Colors.white.withValues(alpha: 0.1),
          Colors.white.withValues(alpha: 0.05),
        ],
        iconColor: Colors.white24,
      ),
    );
  }
}
