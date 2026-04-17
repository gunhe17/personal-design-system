import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../atoms/app_avatar.dart';
import '../atoms/app_list_item.dart';
import '../atoms/app_status_indicator.dart';

class AppStackedList extends StatelessWidget {
  const AppStackedList({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final dividerColor = isDark ? Colors.white.withValues(alpha: 0.05) : AppColors.gray200;

    return Column(
      children: [
        _buildItem(
          name: 'Leslie Alexander',
          email: 'leslie.alexander@example.com',
          role: 'Co-Founder / CEO',
          status: '3h ago',
          isDark: isDark,
        ),
        Divider(color: dividerColor, height: 1),
        _buildItem(
          name: 'Michael Foster',
          email: 'michael.foster@example.com',
          role: 'Co-Founder / CTO',
          status: '3h ago',
          isDark: isDark,
        ),
        Divider(color: dividerColor, height: 1),
        _buildItem(
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
    required String name,
    required String email,
    required String role,
    required String status,
    bool isOnline = false,
    required bool isDark,
  }) {
    return AppListItem(
      onTap: () {}, // 애니메이션 활성화를 위한 콜백 추가
      leading: AppAvatar(isOnline: isOnline),
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
          AppStatusIndicator(isOnline: isOnline, lastSeen: status),
        ],
      ),
    );
  }
}
