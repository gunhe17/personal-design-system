import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';

class AppIconBox extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;
  final Color? iconColor;

  const AppIconBox({
    super.key,
    required this.icon,
    this.size = 40.0,
    this.color,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color ?? AppColors.pointOrange,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      ),
      child: Center(
        child: Icon(
          icon,
          color: iconColor,
          size: size * 0.5,
        ),
      ),
    );
  }
}
