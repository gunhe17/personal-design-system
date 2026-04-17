import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../../core/app_dimensions.dart';
import '../atoms/app_feature_item.dart';
import '../atoms/app_surface.dart';

class AppProductSection extends StatelessWidget {
  const AppProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.gray950 : Colors.white,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 1024;

          if (isWide) {
            return Row(
              children: [
                Expanded(child: _buildTextContent(isDark)),
                const SizedBox(width: 80),
                Expanded(child: _buildProductImage(isDark)),
              ],
            );
          }

          return Column(
            children: [
              _buildTextContent(isDark),
              const SizedBox(height: 64),
              _buildProductImage(isDark),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTextContent(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deploy faster',
          style: AppTypography.labelSmall.copyWith(
            color: AppColors.pointOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'A better workflow',
          style: AppTypography.headlineLarge.copyWith(
            color: isDark ? Colors.white : AppColors.gray900,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores impedit perferendis suscipit eaque, iste dolor cupiditate blanditiis ratione.',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.gray500,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 48),
        const AppFeatureItem(
          icon: Icons.cloud_upload_outlined,
          title: 'Push to deploy.',
          description: 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores impedit perferendis suscipit eaque, iste dolor cupiditate blanditiis ratione.',
          variant: AppFeatureItemVariant.inline,
        ),
        const SizedBox(height: 32),
        const AppFeatureItem(
          icon: Icons.lock_outline,
          title: 'SSL certificates.',
          description: 'Anim aute id magna aliqua ad ad non deserunt sunt. Qui irure qui lorem cupidatat commodo.',
          variant: AppFeatureItemVariant.inline,
        ),
        const SizedBox(height: 32),
        const AppFeatureItem(
          icon: Icons.storage_outlined,
          title: 'Database backups.',
          description: 'Ac tincidunt sapien vehicula erat auctor pellentesque rhoncus. Et magna sit morbi lobortis.',
          variant: AppFeatureItemVariant.inline,
        ),
      ],
    );
  }

  Widget _buildProductImage(bool isDark) {
    return AppSurface(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark 
                  ? [AppColors.gray800, AppColors.gray900]
                  : [AppColors.gray100, AppColors.gray200],
            ),
          ),
          child: Center(
            child: Icon(
              Icons.devices_other,
              size: 48,
              color: isDark ? AppColors.gray700 : AppColors.gray300,
            ),
          ),
        ),
      ),
    );
  }
}
