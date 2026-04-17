import 'package:flutter/material.dart';
import '../atoms/app_button.dart';
import '../atoms/app_checkbox.dart';
import '../atoms/app_field_label.dart';
import '../atoms/app_form_field.dart';
import '../atoms/app_section_header.dart';

class AppFormLayout extends StatelessWidget {
  const AppFormLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- SECTION 1: Profile ---
          const AppSectionHeader(
            title: 'Profile',
            description: 'This information will be displayed publicly.',
            variant: AppSectionHeaderVariant.section,
          ),
          const SizedBox(height: 32),
          const AppFormField(label: 'Username', prefix: 'workcation.com/', hint: 'janesmith'),

          const SizedBox(height: 24),
          const AppFormField(
            label: 'About',
            hint: 'Write a few sentences about yourself.',
            maxLines: 3,
            helperText: 'Brief description for your profile.',
          ),
          
          const SizedBox(height: 48),

          // --- SECTION 2: Personal Information ---
          const AppSectionHeader(
            title: 'Personal Information',
            description: 'Use a permanent address where you can receive mail.',
            variant: AppSectionHeaderVariant.section,
          ),
          const SizedBox(height: 32),
          const Row(
            children: [
              Expanded(child: AppFormField(label: 'First name', hint: 'Jane')),
              SizedBox(width: 16),
              Expanded(child: AppFormField(label: 'Last name', hint: 'Smith')),
            ],
          ),
          const SizedBox(height: 24),
          const AppFormField(label: 'Email address', hint: 'jane.smith@example.com'),

          const SizedBox(height: 48),

          // --- SECTION 3: Notifications ---
          const AppSectionHeader(
            title: 'Notifications',
            description: "Choose how you want to hear from us.",
            variant: AppSectionHeaderVariant.section,
          ),
          const SizedBox(height: 32),
          const AppFieldLabel(label: 'By Email'),
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
}
