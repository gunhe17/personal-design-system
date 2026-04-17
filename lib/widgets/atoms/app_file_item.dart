import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import 'app_button.dart';

class AppFileItem extends StatelessWidget {
  final String fileName;
  final String fileSize;
  final VoidCallback? onDownload;

  const AppFileItem({
    super.key,
    required this.fileName,
    required this.fileSize,
    this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(Icons.attach_file, size: 16, color: AppColors.gray500),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    fileName,
                    style: AppTypography.labelSmall.copyWith(
                      color: isDark ? Colors.white : AppColors.gray900,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  fileSize,
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.gray500, 
                    fontSize: 11
                  ),
                ),
              ],
            ),
          ),
          if (onDownload != null)
            AppButton(
              text: 'Download',
              variant: AppButtonVariant.text,
              onPressed: onDownload,
            ),
        ],
      ),
    );
  }
}
