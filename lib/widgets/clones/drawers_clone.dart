import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../atoms/app_button.dart';
import '../atoms/app_drawer.dart';
import '../atoms/app_description_item.dart';
import '../atoms/app_avatar.dart';

class DrawersClone extends StatelessWidget {
  const DrawersClone({super.key});

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
            content: Row(
              children: [
                AppAvatar(imageUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80', size: 24),
                SizedBox(width: 8),
                AppAvatar(imageUrl: 'https://images.unsplash.com/photo-1517365830460-955ce3ccd263?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80', size: 24),
                SizedBox(width: 8),
                AppAvatar(imageUrl: 'https://images.unsplash.com/photo-1519345182560-3f2917c472ef?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80', size: 24),
              ],
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
