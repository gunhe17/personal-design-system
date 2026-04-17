import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../../core/app_typography.dart';

class AppTextField extends StatelessWidget {
  final String? prefix;
  final String hint;
  final bool isPassword;
  final int maxLines;
  final String? helperText;
  final TextEditingController? controller;

  const AppTextField({
    super.key,
    this.prefix,
    required this.hint,
    this.isPassword = false,
    this.maxLines = 1,
    this.helperText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AppColors.gray800 : AppColors.gray200;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: maxLines > 1 ? null : AppDimensions.componentHeight,
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            crossAxisAlignment: maxLines > 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              // 01. Prefix Area
              if (prefix != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  height: AppDimensions.componentHeight - 2, // 보더 두께 제외
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: borderColor)),
                  ),
                  child: Text(
                    prefix!, 
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.gray500,
                      height: 1.2, // 폰트 정렬을 위한 높이 조정
                    ),
                  ),
                ),
              // 02. Input Area
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: isPassword,
                  maxLines: maxLines,
                  textAlignVertical: maxLines > 1 ? TextAlignVertical.top : TextAlignVertical.center,
                  cursorColor: isDark ? AppColors.gray400 : AppColors.gray600,
                  cursorHeight: 16,
                  style: AppTypography.bodySmall.copyWith(
                    color: isDark ? Colors.white : AppColors.gray900,
                    height: 1.2,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    filled: false,
                    hintText: hint,
                    hintStyle: AppTypography.bodySmall.copyWith(color: AppColors.gray500, height: 1.2),
                    // 핵심: 상하 여백을 동일하게 주어 텍스트 엔진이 중앙을 잡게 함
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10, 
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (helperText != null) ...[
          const SizedBox(height: 8),
          Text(
            helperText!, 
            style: AppTypography.labelSmall.copyWith(color: AppColors.gray500, fontSize: 11),
          ),
        ],
      ],
    );
  }
}
