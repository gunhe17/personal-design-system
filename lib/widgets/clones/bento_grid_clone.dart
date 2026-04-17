import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../../core/app_dimensions.dart';
import '../atoms/app_surface.dart';
import '../atoms/app_pill.dart';

class BentoGridClone extends StatelessWidget {
  const BentoGridClone({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return AppSurface(
      showBorder: false,
      color: isDark ? AppColors.gray950 : Colors.white,
      borderRadius: BorderRadius.zero,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        children: [
          const AppPill(text: 'Deploy faster'),
          const SizedBox(height: 12),
          Text(
            'Everything you need to deploy your app',
            textAlign: TextAlign.center,
            style: AppTypography.headlineLarge.copyWith(
              color: isDark ? Colors.white : AppColors.gray900,
            ),
          ),
          const SizedBox(height: 48),
          
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 1024;
              
              if (isWide) {
                return const IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Left Column (Big)
                      Expanded(
                        child: _BentoBox(
                          title: 'Mobile friendly',
                          description: 'Anim aute id magna aliqua ad ad non deserunt sunt.',
                          height: double.infinity,
                          imagePlaceholder: '📱',
                        ),
                      ),
                      SizedBox(width: 16),
                      // Middle Column (Stacked)
                      Expanded(
                        child: Column(
                          children: [
                            _BentoBox(
                              title: 'Performance',
                              description: 'Lorem ipsum, dolor sit amet consectetur.',
                              height: 240,
                              imagePlaceholder: '⚡',
                            ),
                            SizedBox(height: 16),
                            _BentoBox(
                              title: 'Security',
                              description: 'Morbi viverra dui mi arcu sed. Tellus semper.',
                              height: 240,
                              imagePlaceholder: '🛡️',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      // Right Column (Big)
                      Expanded(
                        child: _BentoBox(
                          title: 'Powerful APIs',
                          description: 'Sit quis amet rutrum tellus ullamcorper.',
                          height: double.infinity,
                          imagePlaceholder: '🔌',
                        ),
                      ),
                    ],
                  ),
                );
              }
              
              // Mobile View (Single Column)
              return const Column(
                children: [
                  _BentoBox(
                    title: 'Mobile friendly',
                    description: 'Anim aute id magna aliqua ad ad non deserunt sunt.',
                    height: 300,
                    imagePlaceholder: '📱',
                  ),
                  SizedBox(height: 16),
                  _BentoBox(
                    title: 'Performance',
                    description: 'Lorem ipsum, dolor sit amet consectetur.',
                    height: 240,
                    imagePlaceholder: '⚡',
                  ),
                  SizedBox(height: 16),
                  _BentoBox(
                    title: 'Security',
                    description: 'Morbi viverra dui mi arcu sed. Tellus semper.',
                    height: 240,
                    imagePlaceholder: '🛡️',
                  ),
                  SizedBox(height: 16),
                  _BentoBox(
                    title: 'Powerful APIs',
                    description: 'Sit quis amet rutrum tellus ullamcorper.',
                    height: 300,
                    imagePlaceholder: '🔌',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _BentoBox extends StatelessWidget {
  final String title;
  final String description;
  final double height;
  final String imagePlaceholder;

  const _BentoBox({
    required this.title,
    required this.description,
    required this.height,
    required this.imagePlaceholder,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: height,
      child: AppSurface(
        color: isDark ? AppColors.gray800 : AppColors.gray50,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.labelMedium.copyWith(
                      color: isDark ? Colors.white : AppColors.gray900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.gray500,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Placeholder for content/image
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: AppSurface(
                color: isDark ? AppColors.gray900 : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.radiusMd),
                ),
                child: SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      imagePlaceholder,
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
