import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../atoms/app_team_member_card.dart';

class AppTeamSection extends StatelessWidget {
  const AppTeamSection({super.key});

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
                return AppTeamMemberCard(
                  name: member.name,
                  role: member.role,
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

  const _Member(this.name, this.role);
}

const _teamMembers = [
  _Member('Leslie Alexander', 'Co-Founder / CEO'),
  _Member('Michael Foster', 'Co-Founder / CTO'),
  _Member('Dries Vincent', 'Business Relations'),
  _Member('Lindsay Walton', 'Front-end Developer'),
  _Member('Courtney Henry', 'Designer'),
  _Member('Tom Cook', 'Director of Product'),
];
