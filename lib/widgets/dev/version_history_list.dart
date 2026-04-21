import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../../services/dev_edit_service.dart';
import '../atoms/app_icon_button.dart';
import '../atoms/app_pill.dart';
import '../atoms/app_surface.dart';

class VersionHistoryList extends StatelessWidget {
  final List<VersionEntry> versions;
  final void Function(VersionEntry) onRollback;
  final bool rollbackBusy;

  const VersionHistoryList({
    super.key,
    required this.versions,
    required this.onRollback,
    this.rollbackBusy = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (versions.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          'No versions yet.',
          style: AppTypography.bodySmall.copyWith(color: AppColors.gray500),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final v in versions) ...[
          AppSurface(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          AppPill(
                            text: _formatTime(v.timestamp),
                          ),
                          if (v.isRollback) ...[
                            const SizedBox(width: 6),
                            const AppPill(
                              text: 'ROLLBACK',
                              color: Color(0x26EF4444),
                              textColor: Color(0xFFEF4444),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        v.prompt.isEmpty ? '(no prompt)' : v.prompt,
                        style: AppTypography.bodySmall.copyWith(
                          color: isDark ? AppColors.gray200 : AppColors.gray800,
                        ),
                      ),
                      if (v.modifiedFiles.isNotEmpty) ...[
                        const SizedBox(height: 6),
                        Text(
                          v.modifiedFiles.join(', '),
                          style: AppTypography.labelSmall.copyWith(
                            color: AppColors.gray500,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                AppIconButton(
                  icon: Icons.settings_backup_restore,
                  size: 16,
                  onPressed: rollbackBusy ? null : () => onRollback(v),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }

  String _formatTime(DateTime t) {
    final local = t.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${local.year}-${two(local.month)}-${two(local.day)} ${two(local.hour)}:${two(local.minute)}:${two(local.second)}';
  }
}
