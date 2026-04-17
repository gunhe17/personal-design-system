import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../../core/app_animations.dart';
import '../atoms/app_select_trigger.dart';
import '../atoms/app_surface.dart';

enum DropdownAlignment { left, center, right }

class AppDropdown extends StatefulWidget {
  final DropdownAlignment alignment;
  final String title;

  const AppDropdown({
    super.key,
    this.alignment = DropdownAlignment.left,
    this.title = 'Options',
  });

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: AppAnimations.normal,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: AppAnimations.defaultCurve,
    ).drive(Tween<double>(begin: AppAnimations.dropdownScaleBegin, end: 1.0));
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: AppAnimations.defaultCurve,
    ).drive(Tween<double>(begin: AppAnimations.fadeBegin, end: 1.0));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleDropdown() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CrossAxisAlignment crossAlignment;
    Alignment menuAlignment;
    switch (widget.alignment) {
      case DropdownAlignment.left:
        crossAlignment = CrossAxisAlignment.start;
        menuAlignment = Alignment.topLeft;
        break;
      case DropdownAlignment.center:
        crossAlignment = CrossAxisAlignment.center;
        menuAlignment = Alignment.topCenter;
        break;
      case DropdownAlignment.right:
        crossAlignment = CrossAxisAlignment.end;
        menuAlignment = Alignment.topRight;
        break;
    }

    return UnconstrainedBox(
      alignment: switch (widget.alignment) {
        DropdownAlignment.left => Alignment.topLeft,
        DropdownAlignment.center => Alignment.topCenter,
        DropdownAlignment.right => Alignment.topRight,
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAlignment,
        children: [
          AppSelectTrigger(
            text: widget.title,
            isOpen: _isOpen,
            onTap: _toggleDropdown,
            variant: AppSelectTriggerVariant.dropdown,
            expand: false,
          ),
          const SizedBox(height: 8),
          SizeTransition(
            sizeFactor: _fadeAnimation,
            axisAlignment: -1,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                alignment: menuAlignment,
                child: AppSurface(
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 4),
                        _menuItem('Account settings', Icons.person_outline),
                        _menuItem('Support', Icons.help_outline),
                        _menuItem('License', Icons.description_outlined),
                        Divider(color: Theme.of(context).colorScheme.outline, height: 1),
                        _menuItem('Sign out', Icons.logout),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(String title, IconData icon) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        splashColor: AppAnimations.splashColor(context),
        highlightColor: Colors.transparent,
        splashFactory: AppAnimations.splashFactory,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Icon(icon, size: 16, color: isDark ? AppColors.gray400 : AppColors.gray500),
              const SizedBox(width: 12),
              Text(title, style: AppTypography.bodySmall.copyWith(color: isDark ? AppColors.gray300 : AppColors.gray700)),
            ],
          ),
        ),
      ),
    );
  }
}
