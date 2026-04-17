import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../atoms/app_feature_item.dart';
import '../atoms/app_surface.dart';
import '../atoms/app_pill.dart';

class FeaturesClone extends StatelessWidget {
  const FeaturesClone({super.key});

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
          // Header Section
          Column(
            children: [
              const AppPill(text: 'Deploy faster'),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'Everything you need to deploy your app',
                  textAlign: TextAlign.center,
                  style: AppTypography.headlineLarge.copyWith(
                    color: isDark ? Colors.white : AppColors.gray900,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'Quis tellus eget adipiscing convallis sit sit eget aliquet quis. Suspendisse eget egestas a elementum pulvinar et feugiat blandit at.',
                  textAlign: TextAlign.center,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.gray500,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 64),
          
          // Features Grid
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 800;
              
              if (isWide) {
                return const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          AppFeatureItem(
                            icon: Icons.cloud_upload_outlined,
                            title: 'Push to deploy',
                            description: 'Morbi viverra dui mi arcu sed. Tellus semper adipiscing suspendisse semper morbi.',
                          ),
                          SizedBox(height: 48),
                          AppFeatureItem(
                            icon: Icons.refresh_outlined,
                            title: 'Simple queues',
                            description: 'Quisque est vel vulputate cursus. Risus proin diam nunc commodo.',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 48),
                    Expanded(
                      child: Column(
                        children: [
                          AppFeatureItem(
                            icon: Icons.lock_outline,
                            title: 'SSL certificates',
                            description: 'Sit quis amet rutrum tellus ullamcorper ultricies libero dolor eget.',
                          ),
                          SizedBox(height: 48),
                          AppFeatureItem(
                            icon: Icons.security_outlined,
                            title: 'Advanced security',
                            description: 'Arcu egestas dolor vel iaculis in ipsum mauris. Tincidunt mattis aliquet hac quis.',
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              
              // Mobile View (Single Column)
              return const Column(
                children: [
                  AppFeatureItem(
                    icon: Icons.cloud_upload_outlined,
                    title: 'Push to deploy',
                    description: 'Morbi viverra dui mi arcu sed. Tellus semper adipiscing suspendisse semper morbi.',
                  ),
                  SizedBox(height: 40),
                  AppFeatureItem(
                    icon: Icons.lock_outline,
                    title: 'SSL certificates',
                    description: 'Sit quis amet rutrum tellus ullamcorper ultricies libero dolor eget.',
                  ),
                  SizedBox(height: 40),
                  AppFeatureItem(
                    icon: Icons.refresh_outlined,
                    title: 'Simple queues',
                    description: 'Quisque est vel vulputate cursus. Risus proin diam nunc commodo.',
                  ),
                  SizedBox(height: 40),
                  AppFeatureItem(
                    icon: Icons.security_outlined,
                    title: 'Advanced security',
                    description: 'Arcu egestas dolor vel iaculis in ipsum mauris. Tincidunt mattis aliquet hac quis.',
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
