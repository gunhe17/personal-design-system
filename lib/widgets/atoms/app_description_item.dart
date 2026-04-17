import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';

class AppDescriptionItem extends StatelessWidget {
  final String label;
  final Widget content;

  const AppDescriptionItem({
    super.key,
    required this.label,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // 태블릿/데스크탑 환경에서는 3열 그리드 느낌(1:2) 재현
          if (constraints.maxWidth > 600) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: constraints.maxWidth * 0.33,
                  child: Text(
                    label,
                    style: AppTypography.labelMedium.copyWith(
                      color: isDark ? AppColors.gray100 : AppColors.gray900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: content,
                ),
              ],
            );
          }
          
          // 모바일 환경에서는 수직 배치
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTypography.labelMedium.copyWith(
                  color: isDark ? AppColors.gray100 : AppColors.gray900,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              content,
            ],
          );
        },
      ),
    );
  }
}
