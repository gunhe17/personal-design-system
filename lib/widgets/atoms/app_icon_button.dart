import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_animations.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final Color? color;

  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = 20.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultColor = isDark ? AppColors.gray400 : AppColors.gray500;

    return Opacity(
      opacity: onPressed == null ? 0.5 : 1.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(), // 아이콘 버튼은 원형 피드백이 표준
          splashColor: AppAnimations.splashColor(context),
          splashFactory: AppAnimations.splashFactory,
          highlightColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0), // 클릭 영역 확보
            child: Icon(
              icon,
              size: size,
              color: color ?? defaultColor,
            ),
          ),
        ),
      ),
    );
  }
}
