import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../../core/app_animations.dart';
import 'app_icon_button.dart';

class AppDrawer extends StatefulWidget {
  final String title;
  final Widget child;
  final Widget? footer;

  const AppDrawer({
    super.key,
    required this.title,
    required this.child,
    this.footer,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();

  static void show(BuildContext context, {required String title, required Widget child, Widget? footer}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Close Drawer',
      barrierColor: AppColors.gray950.withValues(alpha: 0.5),
      transitionDuration: AppAnimations.slow,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: AppDrawer(title: title, footer: footer, child: child),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: child,
        );
      },
    );
  }
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 400,
        height: double.infinity,
        decoration: BoxDecoration(
          color: isDark ? AppColors.gray900 : Colors.white,
          border: Border(left: BorderSide(color: isDark ? AppColors.gray800 : AppColors.gray200)),
          boxShadow: AppColors.elevation(3, isDark),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: AppTypography.headlineMedium.copyWith(
                      color: isDark ? Colors.white : AppColors.gray900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // 원자 위젯으로 교체
                  AppIconButton(
                    icon: Icons.close,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: widget.child,
              ),
            ),
            
            if (widget.footer != null)
              Padding(
                padding: const EdgeInsets.all(24),
                child: widget.footer!,
              ),
          ],
        ),
      ),
    );
  }
}
