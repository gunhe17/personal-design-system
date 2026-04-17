import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../../core/app_animations.dart';

class AppSelectOption extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final bool isSelected;
  final VoidCallback? onTap;

  const AppSelectOption({
    super.key,
    this.imageUrl,
    required this.name,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: AppAnimations.splashColor(context),
        splashFactory: AppAnimations.splashFactory,
        highlightColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              if (imageUrl != null)
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(imageUrl!),
                )
              else
                const CircleAvatar(
                  radius: 10,
                  child: Icon(Icons.person, size: 12),
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  name,
                  style: AppTypography.bodySmall.copyWith(
                    color: isDark ? Colors.white : AppColors.gray900,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              if (isSelected)
                const Icon(
                  Icons.check,
                  size: 20,
                  color: AppColors.pointOrange,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
