import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';

class AppAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;
  final bool isOnline;

  const AppAvatar({
    super.key,
    required this.imageUrl,
    this.size = 48.0,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDark ? AppColors.gray800 : AppColors.gray100,
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: isDark ? Colors.white.withOpacity(0.1) : AppColors.gray200,
              width: 1,
            ),
          ),
        ),
        if (isOnline)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: size * 0.25,
              height: size * 0.25,
              decoration: BoxDecoration(
                color: const Color(0xFF10B981), // Emerald-500
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark ? AppColors.darkBackground : AppColors.lightSurface,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
