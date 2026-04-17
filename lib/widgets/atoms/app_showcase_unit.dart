import 'package:flutter/material.dart';
import '../../core/app_typography.dart';

class AppShowcaseUnit extends StatelessWidget {
  final String label;
  final String? value;
  final Widget child;
  final double bottomPadding;

  const AppShowcaseUnit({
    super.key,
    required this.label,
    this.value,
    required this.child,
    this.bottomPadding = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 01. Info Label (e.g., Large — 24px)
          Text(
            value != null ? '$label — $value' : label,
            style: AppTypography.labelSmall.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 10,
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          // 02. Component Content
          child,
        ],
      ),
    );
  }
}
