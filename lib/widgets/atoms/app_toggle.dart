import 'package:flutter/material.dart';
import '../../core/app_animations.dart';
import '../../core/app_colors.dart';

class AppToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final double width;
  final double height;

  const AppToggle({
    super.key,
    required this.value,
    this.onChanged,
    this.width = 28,
    this.height = 16,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final trackOff = isDark ? AppColors.gray800 : AppColors.gray200;
    const trackOn = AppColors.pointOrange;
    final thumbSize = height - 4;

    return MouseRegion(
      cursor: onChanged == null ? SystemMouseCursors.basic : SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onChanged == null ? null : () => onChanged!(!value),
        child: Opacity(
          opacity: onChanged == null ? 0.5 : 1.0,
          child: AnimatedContainer(
            duration: AppAnimations.fast,
            curve: AppAnimations.defaultCurve,
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: value ? trackOn : trackOff,
              borderRadius: BorderRadius.circular(height / 2),
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                AnimatedAlign(
                  duration: AppAnimations.fast,
                  curve: AppAnimations.defaultCurve,
                  alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      width: thumbSize,
                      height: thumbSize,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
