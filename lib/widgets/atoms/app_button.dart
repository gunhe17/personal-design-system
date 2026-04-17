import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../../core/app_typography.dart';
import '../../core/app_animations.dart';

enum AppButtonVariant { primary, secondary, text }

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? icon;
  final bool fullWidth;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.icon,
    this.fullWidth = false,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    if (widget.variant == AppButtonVariant.text) {
      return _buildTextButton(isDark);
    }

    return _buildStandardButton(isDark);
  }

  // 1. 일반 버튼 (Primary/Secondary) - 영역 유지
  Widget _buildStandardButton(bool isDark) {
    Color backgroundColor;
    Color textColor;
    BorderSide borderSide = BorderSide.none;

    if (widget.variant == AppButtonVariant.primary) {
      backgroundColor = AppColors.pointOrange;
      textColor = Colors.white;
    } else {
      backgroundColor = isDark ? Colors.white.withOpacity(0.05) : AppColors.gray100;
      textColor = isDark ? Colors.white : AppColors.gray900;
      borderSide = BorderSide(color: isDark ? AppColors.gray800 : AppColors.gray200);
    }

    return Opacity(
      opacity: widget.onPressed == null ? 0.5 : 1.0,
      child: UnconstrainedBox(
        alignment: Alignment.centerLeft,
        constrainedAxis: widget.fullWidth ? Axis.horizontal : null,
        child: Container(
          width: widget.fullWidth ? double.infinity : null,
          height: AppDimensions.componentHeight,
          child: Material(
            color: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
              side: borderSide,
            ),
            child: InkWell(
              onTap: widget.onPressed,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
              splashColor: AppAnimations.splashColor(context),
              splashFactory: AppAnimations.splashFactory,
              highlightColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: const Alignment(0, -0.1),
                child: _buildContent(textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 2. 텍스트 버튼 - 텍스트 크기로 애니메이션 영역 축소
  Widget _buildTextButton(bool isDark) {
    final textColor = _isHovered 
        ? (isDark ? Colors.white : AppColors.gray900) 
        : (isDark ? AppColors.gray400 : AppColors.gray600);

    return Opacity(
      opacity: widget.onPressed == null ? 0.5 : 1.0,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: IntrinsicWidth( // 텍스트 크기에 맞게 너비 축소
          child: Container(
            height: AppDimensions.componentHeight,
            alignment: Alignment.centerLeft,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onPressed,
                borderRadius: BorderRadius.circular(4), // 텍스트 주변의 타이트한 곡률
                splashColor: AppAnimations.splashColor(context).withOpacity(0.05), // 더욱 옅게
                splashFactory: AppAnimations.splashFactory,
                highlightColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2), // 텍스트와 거의 붙는 최소 여백
                  child: _buildContent(textColor, isText: true),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(Color color, {bool isText = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.icon != null) ...[
          Icon(widget.icon, size: 14, color: color),
          const SizedBox(width: 8),
        ],
        Text(
          widget.text,
          style: AppTypography.labelMedium.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
            decoration: isText ? TextDecoration.underline : TextDecoration.none,
            decorationColor: color,
          ),
        ),
      ],
    );
  }
}
