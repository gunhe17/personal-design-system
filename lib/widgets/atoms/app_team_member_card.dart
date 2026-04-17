import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import 'app_avatar.dart';

class AppTeamMemberCard extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String role;
  final double avatarSize;

  const AppTeamMemberCard({
    super.key,
    this.imageUrl,
    required this.name,
    required this.role,
    this.avatarSize = 64,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        AppAvatar(imageUrl: imageUrl, size: avatarSize),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: AppTypography.labelMedium.copyWith(
                  color: isDark ? Colors.white : AppColors.gray900,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                role,
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.pointOrange,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
