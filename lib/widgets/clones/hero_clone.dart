import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../../core/app_dimensions.dart';
import '../atoms/app_button.dart';
import '../atoms/app_surface.dart';

class HeroClone extends StatelessWidget {
  const HeroClone({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.gray950 : Colors.white,
      ),
      child: Stack(
        children: [
          // Background Gradient Effect (Subtle)
          Positioned(
            top: -100,
            left: 100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.pointOrange.withValues(alpha: 0.1),
                    AppColors.pointOrange.withValues(alpha: 0),
                  ],
                ),
              ),
            ),
          ),
          
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Announcement Badge
              _buildBadge(context, isDark),
              
              const SizedBox(height: 32),
              
              // Title
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Text(
                  'Data to enrich your online business',
                  textAlign: TextAlign.center,
                  style: AppTypography.displayLarge.copyWith(
                    color: isDark ? Colors.white : AppColors.gray900,
                    height: 1.1,
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Description
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'Anim aute id magna aliqua ad ad non deserunt sunt. Qui irure qui lorem cupidatat commodo. Elit sunt amet fugiat veniam occaecat.',
                  textAlign: TextAlign.center,
                  style: AppTypography.bodyLarge.copyWith(
                    color: AppColors.gray500,
                    height: 1.6,
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // CTAs
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    text: 'Get started',
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
        ],
      ),
    );
  }

  Widget _buildBadge(BuildContext context, bool isDark) {
    return AppSurface(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Announcing our next round of funding.',
            style: AppTypography.labelSmall.copyWith(color: AppColors.gray500),
          ),
          const SizedBox(width: 8),
          Text(
            'Read more →',
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.pointOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
