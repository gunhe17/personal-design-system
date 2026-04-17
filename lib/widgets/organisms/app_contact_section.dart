import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../atoms/app_button.dart';
import '../atoms/app_checkbox.dart';
import '../atoms/app_form_field.dart';
import '../atoms/app_section_header.dart';

class AppContactSection extends StatelessWidget {
  const AppContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.gray950 : Colors.white,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppDimensions.formMaxWidth),
          child: Column(
            children: [
              // Header
              const AppSectionHeader(
                title: 'Contact sales',
                description: 'Aute magna irure deserunt veniam aliqua magna enim voluptate.',
                variant: AppSectionHeaderVariant.section,
              ),
              const SizedBox(height: 64),
              
              // Form
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Expanded(child: AppFormField(label: 'First name')),
                      SizedBox(width: 16),
                      Expanded(child: AppFormField(label: 'Last name')),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const AppFormField(label: 'Company'),
                  const SizedBox(height: 24),
                  const AppFormField(label: 'Email'),
                  const SizedBox(height: 24),
                  const AppFormField(label: 'Phone number', prefix: 'US', hint: '123-456-7890'),
                  const SizedBox(height: 24),
                  const AppFormField(label: 'Message', maxLines: 4),
                  const SizedBox(height: 24),
                  AppCheckbox(
                    initialValue: false,
                    onChanged: (v) {},
                    title: 'Privacy Policy',
                    description: 'By selecting this, you agree to our privacy policy.',
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      text: "Let's talk",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
