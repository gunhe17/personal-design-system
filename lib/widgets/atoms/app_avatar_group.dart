import 'package:flutter/material.dart';
import 'app_avatar.dart';

class AppAvatarGroup extends StatelessWidget {
  final List<String> imageUrls;
  final double size;
  final double spacing;

  const AppAvatarGroup({
    super.key,
    required this.imageUrls,
    this.size = 24,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < imageUrls.length; i++) ...[
          if (i > 0) SizedBox(width: spacing),
          AppAvatar(imageUrl: imageUrls[i], size: size),
        ],
      ],
    );
  }
}
