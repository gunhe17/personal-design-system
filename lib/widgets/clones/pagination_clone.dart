import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../atoms/app_button.dart';
import '../atoms/app_pagination_item.dart';

class PaginationClone extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const PaginationClone({
    super.key,
    this.currentPage = 1,
    this.totalPages = 10,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? Colors.white.withValues(alpha: 0.05) : AppColors.gray200;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: borderColor)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;

          if (isMobile) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  text: 'Previous',
                  variant: AppButtonVariant.secondary,
                  onPressed: currentPage > 1 ? () {} : null,
                ),
                AppButton(
                  text: 'Next',
                  variant: AppButtonVariant.secondary,
                  onPressed: currentPage < totalPages ? () {} : null,
                ),
              ],
            );
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Results Info
              Text.rich(
                TextSpan(
                  text: 'Showing ',
                  children: [
                    TextSpan(text: '1', style: TextStyle(color: isDark ? Colors.white : AppColors.gray900, fontWeight: FontWeight.bold)),
                    const TextSpan(text: ' to '),
                    TextSpan(text: '10', style: TextStyle(color: isDark ? Colors.white : AppColors.gray900, fontWeight: FontWeight.bold)),
                    const TextSpan(text: ' of '),
                    TextSpan(text: '97', style: TextStyle(color: isDark ? Colors.white : AppColors.gray900, fontWeight: FontWeight.bold)),
                    const TextSpan(text: ' results'),
                  ],
                ),
                style: AppTypography.bodySmall.copyWith(color: AppColors.gray500),
              ),
              
              // Pagination Nav (Using Atoms)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppPaginationItem(icon: const Icon(Icons.chevron_left, size: 20), isFirst: true, onTap: () {}),
                  AppPaginationItem(text: '1', isActive: true, onTap: () {}),
                  AppPaginationItem(text: '2', onTap: () {}),
                  AppPaginationItem(text: '3', onTap: () {}),
                  AppPaginationItem(text: '...', onTap: () {}),
                  AppPaginationItem(text: '8', onTap: () {}),
                  AppPaginationItem(text: '9', onTap: () {}),
                  AppPaginationItem(text: '10', onTap: () {}),
                  AppPaginationItem(icon: const Icon(Icons.chevron_right, size: 20), isLast: true, onTap: () {}),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
