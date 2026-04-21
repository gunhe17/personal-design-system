import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../../core/app_typography.dart';
import 'app_surface.dart';

class AppDiffView extends StatelessWidget {
  final String diff;
  final int? maxLines;

  const AppDiffView({
    super.key,
    required this.diff,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseStyle = AppTypography.labelSmall.copyWith(
      fontFamily: 'monospace',
      fontFamilyFallback: const ['Menlo', 'Courier', 'monospace'],
      color: isDark ? AppColors.gray300 : AppColors.gray700,
      height: 1.5,
      fontSize: 12,
    );

    final lines = diff.split('\n');
    final rendered = <Widget>[];
    for (final line in lines) {
      rendered.add(_line(line, baseStyle, isDark));
    }

    return AppSurface(
      color: isDark ? AppColors.gray950 : AppColors.gray50,
      padding: const EdgeInsets.symmetric(vertical: 8),
      borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: rendered,
      ),
    );
  }

  Widget _line(String line, TextStyle baseStyle, bool isDark) {
    Color? bg;
    Color? fg;
    if (line.startsWith('+') && !line.startsWith('+++')) {
      bg = const Color(0x2622C55E);
      fg = isDark ? const Color(0xFF86EFAC) : const Color(0xFF166534);
    } else if (line.startsWith('-') && !line.startsWith('---')) {
      bg = const Color(0x26EF4444);
      fg = isDark ? const Color(0xFFFCA5A5) : const Color(0xFF991B1B);
    } else if (line.startsWith('@@')) {
      fg = AppColors.pointOrange;
    } else if (line.startsWith('+++') || line.startsWith('---') || line.startsWith('diff ') || line.startsWith('index ')) {
      fg = AppColors.gray500;
    }

    return Container(
      color: bg,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
      child: SelectableText(
        line.isEmpty ? ' ' : line,
        style: baseStyle.copyWith(color: fg ?? baseStyle.color),
      ),
    );
  }
}
