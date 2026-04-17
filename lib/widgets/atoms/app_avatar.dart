import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import 'app_badge.dart';

class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final bool isOnline;

  const AppAvatar({
    super.key,
    this.imageUrl,
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
            border: Border.all(
              color: isDark ? Colors.white.withValues(alpha: 0.1) : AppColors.gray200,
              width: 1,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: imageUrl != null
              ? Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  width: size,
                  height: size,
                  errorBuilder: (context, error, stackTrace) => _buildIcon(isDark),
                )
              : _buildIcon(isDark),
        ),
        if (isOnline)
          Positioned(
            right: 0,
            bottom: 0,
            child: AppBadge(
              size: size * 0.25 + 4,
              variant: AppBadgeVariant.online,
            ),
          ),
      ],
    );
  }

  Widget _buildIcon(bool isDark) {
    return Center(
      child: Icon(
        Icons.person,
        size: size * 0.5,
        color: isDark ? AppColors.gray600 : AppColors.gray400,
      ),
    );
  }
}
