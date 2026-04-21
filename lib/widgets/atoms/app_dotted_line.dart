import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

class AppDottedLine extends StatelessWidget {
  final Color? color;
  final double dotSize;
  final double gap;
  final double? opacity;

  const AppDottedLine({
    super.key,
    this.color,
    this.dotSize = 2,
    this.gap = 4,
    this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base = color ?? (isDark ? AppColors.gray600 : AppColors.gray400);
    final resolved = base.withValues(alpha: opacity ?? 0.45);

    return SizedBox(
      height: dotSize,
      child: CustomPaint(
        painter: _DottedPainter(color: resolved, dotSize: dotSize, gap: gap),
        size: Size.infinite,
      ),
    );
  }
}

class _DottedPainter extends CustomPainter {
  final Color color;
  final double dotSize;
  final double gap;

  _DottedPainter({
    required this.color,
    required this.dotSize,
    required this.gap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final y = size.height / 2;
    final step = dotSize + gap;
    var x = dotSize / 2;
    while (x < size.width) {
      canvas.drawCircle(Offset(x, y), dotSize / 2, paint);
      x += step;
    }
  }

  @override
  bool shouldRepaint(covariant _DottedPainter old) =>
      old.color != color || old.dotSize != dotSize || old.gap != gap;
}
