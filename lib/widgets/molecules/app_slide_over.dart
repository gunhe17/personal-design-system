import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../atoms/app_avatar_group.dart';
import '../atoms/app_button.dart';
import '../atoms/app_description_item.dart';
import '../atoms/app_drawer.dart';

class AppSlideOver extends StatelessWidget {
  const AppSlideOver({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppButton(
        text: 'Open panel',
        variant: AppButtonVariant.secondary,
        onPressed: () {
          _showDemoDrawer(context);
        },
      ),
    );
  }

  void _showDemoDrawer(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    AppDrawer.show(
      context,
      title: 'Panel title',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Get started by filling in the information below to create your new project.',
            style: AppTypography.bodySmall,
          ),
          const SizedBox(height: 32),
          
          // Data visualization using Atoms
          const AppDescriptionItem(
            label: 'Project Name',
            content: Text('Atomic Design System', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Divider(height: 32, thickness: 0.5),
          
          const AppDescriptionItem(
            label: 'Team Members',
            content: AppAvatarGroup(
              imageUrls: [],
            ),
          ),
          const Divider(height: 32, thickness: 0.5),
          
          const Text(
            'Description',
            style: AppTypography.labelSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'This project aims to bridge the gap between HTML/Tailwind templates and Flutter widgets using a strict atomic workflow.',
            style: AppTypography.bodyMedium.copyWith(
              color: isDark ? AppColors.gray400 : AppColors.gray600,
            ),
          ),
        ],
      ),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppButton(
            text: 'Cancel',
            variant: AppButtonVariant.text,
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 12),
          AppButton(
            text: 'Save',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
