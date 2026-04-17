import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../atoms/app_icon_button.dart';
import '../atoms/app_button.dart';
import '../atoms/app_logo.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? AppColors.gray950 : Colors.white;

    return Container(
      width: double.infinity,
      color: backgroundColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 1024;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Row(
              children: [
                // Logo
                const AppLogo(),
                
                const SizedBox(width: 48),

                if (!isMobile) ...[
                  // Desktop Nav
                  AppButton(text: 'Product', variant: AppButtonVariant.text, icon: Icons.keyboard_arrow_down, onPressed: () {}),
                  const SizedBox(width: 16),
                  AppButton(text: 'Features', variant: AppButtonVariant.text, onPressed: () {}),
                  const SizedBox(width: 16),
                  AppButton(text: 'Marketplace', variant: AppButtonVariant.text, onPressed: () {}),
                  const SizedBox(width: 16),
                  AppButton(text: 'Company', variant: AppButtonVariant.text, onPressed: () {}),
                  
                  const Spacer(),
                  
                  // Action
                  AppButton(
                    text: 'Log in',
                    variant: AppButtonVariant.text,
                    onPressed: () {},
                  ),
                ] else ...[
                  const Spacer(),
                  // Mobile Menu Toggle
                  AppIconButton(
                    icon: Icons.menu,
                    onPressed: () {},
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

// TODO: Add Flyout Menu implementation if needed for interaction demo
