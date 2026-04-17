import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../atoms/app_button.dart';
import '../atoms/app_feature_item.dart';
import '../atoms/app_text_field.dart';

class AppNewsletterSection extends StatelessWidget {
  const AppNewsletterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.gray950 : Colors.white,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 1024;

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildSubscribeForm(context, isDark)),
                    const SizedBox(width: 80),
                    Expanded(child: _buildFeaturesGrid(context, isDark)),
                  ],
                );
              }

              return Column(
                children: [
                  _buildSubscribeForm(context, isDark),
                  const SizedBox(height: 64),
                  _buildFeaturesGrid(context, isDark),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSubscribeForm(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subscribe to our newsletter',
          style: AppTypography.headlineLarge.copyWith(
            color: isDark ? Colors.white : AppColors.gray900,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Nostrud amet eu ullamco nisi aute in ad minim nostrud adipisicing velit quis. Duis tempor incididunt dolore.',
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.gray500,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: AppTextField(hint: 'Enter your email'),
            ),
            const SizedBox(width: 12),
            AppButton(
              text: 'Subscribe',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeaturesGrid(BuildContext context, bool isDark) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AppFeatureItem(
            icon: Icons.calendar_today_outlined,
            title: 'Weekly articles',
            description: 'Non laboris consequat cupidatat laborum magna. Eiusmod non irure cupidatat.',
            variant: AppFeatureItemVariant.vertical,
          ),
        ),
        SizedBox(width: 32),
        Expanded(
          child: AppFeatureItem(
            icon: Icons.front_hand_outlined,
            title: 'No spam',
            description: 'Officia excepteur ullamco ut sint duis proident non adipisicing. Voluptate incididunt.',
            variant: AppFeatureItemVariant.vertical,
          ),
        ),
      ],
    );
  }
}
