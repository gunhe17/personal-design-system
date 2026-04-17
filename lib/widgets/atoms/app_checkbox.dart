import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../../core/app_animations.dart';

class AppCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool?>? onChanged;
  final String title;
  final String? description;

  const AppCheckbox({
    super.key,
    this.initialValue = false,
    this.onChanged,
    required this.title,
    this.description,
  });

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  late bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  void _handleTap() {
    setState(() {
      _currentValue = !_currentValue;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(_currentValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    final Color activeColor = isDark ? AppColors.gray400 : AppColors.gray800;
    const Color inactiveColor = Colors.transparent;
    final Color borderColor = _currentValue 
        ? activeColor 
        : (isDark ? AppColors.gray800 : AppColors.gray300);

    return GestureDetector(
      onTap: _handleTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 박스 배경 및 테두리 애니메이션
          AnimatedContainer(
            duration: AppAnimations.fast,
            curve: AppAnimations.defaultCurve,
            width: 18,
            height: 18,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: _currentValue ? activeColor : inactiveColor,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: borderColor),
            ),
            child: AnimatedSwitcher(
              duration: AppAnimations.fast,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation.drive(Tween<double>(begin: AppAnimations.checkboxScaleBegin, end: 1.0)),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: _currentValue 
                  ? const Icon(Icons.check, key: ValueKey('check'), size: 14, color: Colors.white)
                  : const SizedBox.shrink(key: ValueKey('empty')),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title, 
                  style: AppTypography.labelMedium.copyWith(
                    color: isDark ? Colors.white : AppColors.gray900, 
                    fontWeight: FontWeight.w600
                  )
                ),
                if (widget.description != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    widget.description!, 
                    style: AppTypography.bodySmall.copyWith(color: AppColors.gray500, fontSize: 12)
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
