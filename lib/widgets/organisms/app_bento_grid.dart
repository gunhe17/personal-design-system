import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../atoms/app_bento_box.dart';
import '../atoms/app_pill.dart';
import '../atoms/app_surface.dart';

class AppBentoGrid extends StatelessWidget {
  const AppBentoGrid({super.key});

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
                        child: AppBentoBox(
                          title: 'Mobile friendly',
                          description: 'Anim aute id magna aliqua ad ad non deserunt sunt.',
                          height: double.infinity,
                          icon: Icons.smartphone,
                        ),
                      ),
                      SizedBox(width: 16),
                      // Middle Column (Stacked)
                      Expanded(
                        child: Column(
                          children: [
                            AppBentoBox(
                              title: 'Performance',
                              description: 'Lorem ipsum, dolor sit amet consectetur.',
                              height: 240,
                              icon: Icons.bolt,
                            ),
                            SizedBox(height: 16),
                            AppBentoBox(
                              title: 'Security',
                              description: 'Morbi viverra dui mi arcu sed. Tellus semper.',
                              height: 240,
                              icon: Icons.security,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      // Right Column (Big)
                      Expanded(
                        child: AppBentoBox(
                          title: 'Powerful APIs',
                          description: 'Sit quis amet rutrum tellus ullamcorper.',
                          height: double.infinity,
                          icon: Icons.api,
                        ),
                      ),
                    ],
                  ),
                );
              }
              
              // Mobile View (Single Column)
              return const Column(
                children: [
                  AppBentoBox(
                    title: 'Mobile friendly',
                    description: 'Anim aute id magna aliqua ad ad non deserunt sunt.',
                    height: 300,
                    icon: Icons.smartphone,
                  ),
                  SizedBox(height: 16),
                  AppBentoBox(
                    title: 'Performance',
                    description: 'Lorem ipsum, dolor sit amet consectetur.',
                    height: 240,
                    icon: Icons.bolt,
                  ),
                  SizedBox(height: 16),
                  AppBentoBox(
                    title: 'Security',
                    description: 'Morbi viverra dui mi arcu sed. Tellus semper.',
                    height: 240,
                    icon: Icons.security,
                  ),
                  SizedBox(height: 16),
                  AppBentoBox(
                    title: 'Powerful APIs',
                    description: 'Sit quis amet rutrum tellus ullamcorper.',
                    height: 300,
                    icon: Icons.api,
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

