import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import 'app_badge.dart';

class AppStatusIndicator extends StatelessWidget {
  final bool isOnline;
  final String? lastSeen;

  const AppStatusIndicator({
    super.key,
    required this.isOnline,
    this.lastSeen,
  });

  @override
  Widget build(BuildContext context) {
    if (isOnline) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppBadge(variant: AppBadgeVariant.online, size: 8),
          const SizedBox(width: 6),
          Text(
            'Online',
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.gray500,
              fontSize: 11,
            ),
          ),
        ],
      );
    }

    return Text(
      'Last seen ${lastSeen ?? ''}',
      style: AppTypography.labelSmall.copyWith(
        color: AppColors.gray500,
        fontSize: 11,
      ),
    );
  }
}
