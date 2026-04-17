import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../atoms/app_avatar.dart';
import '../atoms/app_list_item.dart';
import '../atoms/app_badge.dart';

class StackedlistsClone extends StatelessWidget {
  const StackedlistsClone({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final dividerColor = isDark ? Colors.white.withValues(alpha: 0.05) : AppColors.gray200;

    return Column(
      children: [
        _buildItem(
          imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
          name: 'Leslie Alexander',
          email: 'leslie.alexander@example.com',
          role: 'Co-Founder / CEO',
          status: '3h ago',
          isDark: isDark,
        ),
        Divider(color: dividerColor, height: 1),
        _buildItem(
          imageUrl: 'https://images.unsplash.com/photo-1519244703995-f4e0f30006d5?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
          name: 'Michael Foster',
          email: 'michael.foster@example.com',
          role: 'Co-Founder / CTO',
          status: '3h ago',
          isDark: isDark,
        ),
        Divider(color: dividerColor, height: 1),
        _buildItem(
          imageUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
          name: 'Dries Vincent',
          email: 'dries.vincent@example.com',
          role: 'Business Relations',
          status: 'Online',
          isOnline: true,
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _buildItem({
    required String imageUrl,
    required String name,
    required String email,
    required String role,
    required String status,
    bool isOnline = false,
    required bool isDark,
  }) {
    return AppListItem(
      onTap: () {}, // 애니메이션 활성화를 위한 콜백 추가
      leading: AppAvatar(imageUrl: imageUrl, isOnline: isOnline),
      title: name,
      subtitle: email,
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            role,
            style: AppTypography.labelSmall.copyWith(
              color: isDark ? Colors.white : AppColors.gray900,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          if (isOnline)
            Row(
              children: [
                const AppBadge(variant: AppBadgeVariant.online, size: 8),
                const SizedBox(width: 6),
                Text(
                  'Online',
                  style: AppTypography.labelSmall.copyWith(color: AppColors.gray500, fontSize: 11),
                ),
              ],
            )
          else
            Text(
              'Last seen $status',
              style: AppTypography.labelSmall.copyWith(color: AppColors.gray500, fontSize: 11),
            ),
        ],
      ),
    );
  }
}
