import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../atoms/app_avatar.dart';

class TeamClone extends StatelessWidget {
  const TeamClone({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.gray950 : Colors.white,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 1024;
          
          final content = [
            // Header
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meet our leadership',
                  style: AppTypography.headlineLarge.copyWith(
                    color: isDark ? Colors.white : AppColors.gray900,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'We’re a dynamic group of individuals who are passionate about what we do and dedicated to delivering the best results for our clients.',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.gray500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
            // Team Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: constraints.maxWidth > 600 ? 2 : 1,
                crossAxisSpacing: 32,
                mainAxisSpacing: 48,
                mainAxisExtent: 64,
              ),
              itemCount: _teamMembers.length,
              itemBuilder: (context, index) {
                final member = _teamMembers[index];
                return Row(
                  children: [
                    AppAvatar(imageUrl: member.imageUrl, size: 64),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            member.name,
                            style: AppTypography.labelMedium.copyWith(
                              color: isDark ? Colors.white : AppColors.gray900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            member.role,
                            style: AppTypography.labelSmall.copyWith(
                              color: AppColors.pointOrange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ];

          if (isWide) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 300, child: content[0]),
                const SizedBox(width: 80),
                Expanded(child: content[2]),
              ],
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: content,
          );
        },
      ),
    );
  }
}

class _Member {
  final String name;
  final String role;
  final String imageUrl;

  const _Member(this.name, this.role, this.imageUrl);
}

const _teamMembers = [
  _Member('Leslie Alexander', 'Co-Founder / CEO', 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80'),
  _Member('Michael Foster', 'Co-Founder / CTO', 'https://images.unsplash.com/photo-1519244703995-f4e0f30006d5?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80'),
  _Member('Dries Vincent', 'Business Relations', 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80'),
  _Member('Lindsay Walton', 'Front-end Developer', 'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80'),
  _Member('Courtney Henry', 'Designer', 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80'),
  _Member('Tom Cook', 'Director of Product', 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80'),
];
