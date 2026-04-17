import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final bool showText;

  const AppLogo({
    super.key,
    this.size = 32.0,
    this.showText = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppColors.pointOrange,
            borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
          ),
          child: Center(
            child: Icon(
              Icons.bolt, 
              color: Colors.white, 
              size: size * 0.625,
            ),
          ),
        ),
        if (showText) ...[
          const SizedBox(width: 12),
          Text(
            'ATOMIC',
            style: TextStyle(
              color: isDark ? Colors.white : AppColors.gray900,
              fontWeight: FontWeight.w900,
              fontSize: size * 0.56,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ],
    );
  }
}
