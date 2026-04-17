import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../atoms/app_nav_item.dart';
import '../atoms/app_icon_button.dart';
import '../atoms/app_button.dart';
import '../atoms/app_logo.dart';

class HeadersClone extends StatelessWidget {
  const HeadersClone({super.key});

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
                  const AppNavItem(text: 'Product', hasDropdown: true),
                  const SizedBox(width: 32),
                  const AppNavItem(text: 'Features'),
                  const SizedBox(width: 32),
                  const AppNavItem(text: 'Marketplace'),
                  const SizedBox(width: 32),
                  const AppNavItem(text: 'Company'),
                  
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
