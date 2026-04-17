import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../../core/app_typography.dart';
import '../../core/app_animations.dart';
import '../atoms/app_surface.dart';

enum DropdownAlignment { left, center, right }

class DropdownsClone extends StatefulWidget {
  final DropdownAlignment alignment;
  final String title;

  const DropdownsClone({
    super.key,
    this.alignment = DropdownAlignment.left,
    this.title = 'Options',
  });

  @override
  State<DropdownsClone> createState() => _DropdownsCloneState();
}

class _DropdownsCloneState extends State<DropdownsClone> with SingleTickerProviderStateMixin {
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
    ).drive(Tween<double>(begin: AppAnimations.dropdownFadeBegin, end: 1.0));
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    CrossAxisAlignment crossAlignment;
    switch (widget.alignment) {
      case DropdownAlignment.left:
        crossAlignment = CrossAxisAlignment.start;
        break;
      case DropdownAlignment.center:
        crossAlignment = CrossAxisAlignment.center;
        break;
      case DropdownAlignment.right:
        crossAlignment = CrossAxisAlignment.end;
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAlignment,
      children: [
        // 01. Dropdown Trigger Button
        Material(
          color: isDark ? AppColors.gray800 : AppColors.gray100,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          child: InkWell(
            onTap: _toggleDropdown,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
            splashColor: AppAnimations.splashColor(context),
            highlightColor: Colors.transparent,
            splashFactory: AppAnimations.splashFactory,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: AppTypography.labelMedium.copyWith(
                      color: isDark ? Colors.white : AppColors.gray900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 6),
                  AnimatedRotation(
                    turns: _isOpen ? 0.5 : 0,
                    duration: AppAnimations.normal,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: AppColors.gray400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 8),
        
        // 02. Dropdown Menu
        SizeTransition(
          sizeFactor: _fadeAnimation,
          axisAlignment: -1,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              alignment: Alignment.topCenter,
              child: AppSurface(
                child: SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 4),
                      _buildMenuItem('Account settings', Icons.person_outline, isDark),
                      _buildMenuItem('Support', Icons.help_outline, isDark),
                      _buildMenuItem('License', Icons.description_outlined, isDark),
                      Divider(color: Theme.of(context).colorScheme.outline, height: 1),
                      _buildMenuItem('Sign out', Icons.logout, isDark),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(String title, IconData icon, bool isDark) {
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
              Text(
                title,
                style: AppTypography.bodySmall.copyWith(
                  color: isDark ? AppColors.gray300 : AppColors.gray700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
