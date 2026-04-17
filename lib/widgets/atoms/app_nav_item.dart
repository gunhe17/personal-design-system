import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';

class AppNavItem extends StatefulWidget {
  final String text;
  final bool hasDropdown;
  final VoidCallback? onTap;

  const AppNavItem({
    super.key,
    required this.text,
    this.hasDropdown = false,
    this.onTap,
  });

  @override
  State<AppNavItem> createState() => _AppNavItemState();
}

class _AppNavItemState extends State<AppNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // 무채색 강조 원칙에 따라 호버 시 색상 강조
    final textColor = _isHovered 
        ? (isDark ? Colors.white : AppColors.gray900) 
        : (isDark ? AppColors.gray400 : AppColors.gray600);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text,
                style: AppTypography.labelMedium.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (widget.hasDropdown) ...[
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: AppColors.gray500,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
