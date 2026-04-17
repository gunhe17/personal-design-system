import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_dimensions.dart';
import '../core/app_typography.dart';

class ExampleProfilePage extends StatelessWidget {
  const ExampleProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : AppColors.gray900;
    final secondaryTextColor = isDark ? AppColors.gray400 : AppColors.gray500;

    return Container(
      color: isDark ? AppColors.darkBackground : AppColors.lightSurface,
      padding: const EdgeInsets.all(AppDimensions.s6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: AppColors.pointGradient),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.lightSurface, width: 2),
                ),
                child: const Center(
                  child: Text('G', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gunhee Kim', style: AppTypography.headlineSmall.copyWith(color: textColor)),
                  Text('Product Designer', style: AppTypography.bodySmall.copyWith(color: secondaryTextColor)),
                ],
              ),
              const Spacer(),
              _buildButton('Edit Profile', isDark),
            ],
          ),
          const SizedBox(height: 32),
          Text('Personal Information', style: AppTypography.titleMedium.copyWith(color: textColor)),
          const SizedBox(height: 16),
          _buildInfoRow('Email Address', 'gunhee@example.com', isDark),
          _buildInfoRow('Location', 'Seoul, South Korea', isDark),
          _buildInfoRow('Company', 'Codespace Inc.', isDark),
          const SizedBox(height: 40),
          _buildSection('Notifications', [
            _buildToggleRow('Email Notifications', true),
            _buildToggleRow('Push Notifications', false),
          ], isDark),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.bodyMedium.copyWith(color: isDark ? AppColors.gray400 : AppColors.gray500)),
          Text(value, style: AppTypography.bodyMedium.copyWith(color: isDark ? Colors.white : AppColors.gray900, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.titleMedium.copyWith(color: isDark ? Colors.white : AppColors.gray900)),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildToggleRow(String label, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.bodyMedium),
          Switch(
            value: value,
            onChanged: (v) {},
            activeThumbColor: AppColors.pointOrange,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? AppColors.gray800 : AppColors.gray100,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      ),
      child: Text(
        text,
        style: AppTypography.labelSmall.copyWith(
          color: isDark ? Colors.white : AppColors.gray900,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
