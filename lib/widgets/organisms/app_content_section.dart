import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../atoms/app_feature_item.dart';
import '../atoms/app_image_placeholder.dart';
import '../atoms/app_pill.dart';

class AppContentSection extends StatelessWidget {
  const AppContentSection({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: _buildTextContent(context, isDark),
                ),
                const SizedBox(width: 80),
                Expanded(
                  flex: 4,
                  child: _buildStickyImage(),
                ),
              ],
            );
          }

          return Column(
            children: [
              _buildTextContent(context, isDark),
              const SizedBox(height: 64),
              _buildStickyImage(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppPill(text: 'Deploy faster'),
        const SizedBox(height: 16),
        Text(
          'A better workflow',
          style: AppTypography.headlineLarge.copyWith(
            color: isDark ? Colors.white : AppColors.gray900,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Aliquet nec orci mattis amet quisque ullamcorper neque, nibh sem. At arcu, sit dui mi, nibh dui, diam eget aliquam. Quisque id at vitae feugiat egestas.',
          style: AppTypography.bodyLarge.copyWith(
            color: isDark ? AppColors.gray300 : AppColors.gray700,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 48),
        _buildFeatureList(),
        const SizedBox(height: 48),
        Text(
          'Et vitae blandit facilisi magna lacus commodo. Vitae sapien duis odio id et. Id blandit molestie auctor fermentum dignissim. Lacus diam tincidunt ac cursus in vel.',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.gray500,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 64),
        Text(
          'No server? No problem.',
          style: AppTypography.titleLarge.copyWith(
            color: isDark ? Colors.white : AppColors.gray900,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Id orci tellus laoreet id ac. Dolor, aenean leo, ac etiam consequat in. Convallis arcu ipsum urna nibh. Pharetra, euismod vitae interdum mauris enim, consequat vulputate nibh.',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.gray500,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureList() {
    return const Column(
      children: [
        AppFeatureItem(
          icon: Icons.cloud_upload_outlined,
          title: 'Push to deploy.',
          description: 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores impedit perferendis suscipit eaque.',
          variant: AppFeatureItemVariant.inline,
        ),
        SizedBox(height: 32),
        AppFeatureItem(
          icon: Icons.lock_outline,
          title: 'SSL certificates.',
          description: 'Anim aute id magna aliqua ad ad non deserunt sunt. Qui irure qui lorem cupidatat commodo.',
          variant: AppFeatureItemVariant.inline,
        ),
        SizedBox(height: 32),
        AppFeatureItem(
          icon: Icons.storage_outlined,
          title: 'Database backups.',
          description: 'Ac tincidunt sapien vehicula erat auctor pellentesque rhoncus. Et magna sit morbi lobortis.',
          variant: AppFeatureItemVariant.inline,
        ),
      ],
    );
  }

  Widget _buildStickyImage() {
    return const AppImagePlaceholder(icon: Icons.screenshot_monitor);
  }
}
