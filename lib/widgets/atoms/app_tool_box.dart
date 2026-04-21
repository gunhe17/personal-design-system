import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';

class AppToolBox extends StatelessWidget {
  final List<Widget> children;
  final double gap;
  final EdgeInsetsGeometry padding;

  const AppToolBox({
    super.key,
    required this.children,
    this.gap = 6,
    this.padding = const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.gray800 : AppColors.gray100;
    final border = isDark ? AppColors.gray700 : AppColors.gray200;

    final items = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      if (i > 0) items.add(SizedBox(width: gap));
      items.add(children[i]);
    }

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
        border: Border.all(color: border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items,
      ),
    );
  }
}
