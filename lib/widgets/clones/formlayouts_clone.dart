import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../../core/app_typography.dart';
import '../atoms/app_button.dart';
import '../atoms/app_text_field.dart';
import '../atoms/app_checkbox.dart';

class FormlayoutsClone extends StatelessWidget {
  const FormlayoutsClone({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- SECTION 1: Profile ---
          _buildSectionHeader(context, 'Profile', 'This information will be displayed publicly.', isDark),
          const SizedBox(height: 32),
          _buildFieldLabel('Username', isDark),
          const SizedBox(height: 8),
          const AppTextField(prefix: 'workcation.com/', hint: 'janesmith'),
          
          const SizedBox(height: 24),
          _buildFieldLabel('About', isDark),
          const SizedBox(height: 8),
          const AppTextField(
            hint: 'Write a few sentences about yourself.', 
            maxLines: 3,
            helperText: 'Brief description for your profile.',
          ),
          
          const SizedBox(height: 48),

          // --- SECTION 2: Personal Information ---
          _buildSectionHeader(context, 'Personal Information', 'Use a permanent address where you can receive mail.', isDark),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(child: _buildFieldColumn(context, 'First name', 'Jane')),
              const SizedBox(width: 16),
              Expanded(child: _buildFieldColumn(context, 'Last name', 'Smith')),
            ],
          ),
          const SizedBox(height: 24),
          _buildFieldColumn(context, 'Email address', 'jane.smith@example.com'),

          const SizedBox(height: 48),

          // --- SECTION 3: Notifications ---
          _buildSectionHeader(context, 'Notifications', "Choose how you want to hear from us.", isDark),
          const SizedBox(height: 32),
          _buildFieldLabel('By Email', isDark),
          const SizedBox(height: 16),
          AppCheckbox(
            initialValue: true, 
            onChanged: (v) {}, 
            title: 'Comments', 
            description: 'Get notified when someone posts a comment.',
          ),
          const SizedBox(height: 16),
          AppCheckbox(
            initialValue: false, 
            onChanged: (v) {}, 
            title: 'Candidates', 
            description: 'Get notified when a candidate applies.',
          ),
          
          const SizedBox(height: 48),
          
          // --- FOOTER ACTIONS ---
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton(text: 'Cancel', variant: AppButtonVariant.text, onPressed: () {}),
              const SizedBox(width: 12),
              AppButton(text: 'Save', variant: AppButtonVariant.primary, onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, String subtitle, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.titleLarge.copyWith(color: isDark ? Colors.white : AppColors.gray900, fontWeight: FontWeight.w800)),
        const SizedBox(height: 4),
        Text(subtitle, style: AppTypography.bodySmall.copyWith(color: AppColors.gray500)),
        const SizedBox(height: 16),
        Divider(color: isDark ? AppColors.gray800 : AppColors.gray200, height: 1),
      ],
    );
  }

  Widget _buildFieldLabel(String label, bool isDark) {
    return Text(label, style: AppTypography.labelMedium.copyWith(color: isDark ? Colors.white : AppColors.gray900, fontWeight: FontWeight.w600));
  }

  Widget _buildFieldColumn(BuildContext context, String label, String hint) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(label, isDark),
        const SizedBox(height: 8),
        AppTextField(hint: hint),
      ],
    );
  }
}
