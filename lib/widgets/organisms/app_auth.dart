import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../../core/app_typography.dart';
import '../atoms/app_button.dart';
import '../atoms/app_field_label.dart';
import '../atoms/app_text_field.dart';

class AppAuth extends StatelessWidget {
  const AppAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.layers, color: AppColors.pointOrange, size: 40),
              const SizedBox(height: 32),
              Text(
                'Sign in to your account',
                style: AppTypography.displaySmall.copyWith(
                  color: isDark ? Colors.white : AppColors.gray900,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppFieldLabel(label: 'Email address'),
                  SizedBox(height: AppDimensions.gapDescription),
                  AppTextField(hint: 'gunhee@example.com'),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppFieldLabel(label: 'Password'),
                      AppButton(text: 'Forgot password?', variant: AppButtonVariant.text),
                    ],
                  ),
                  SizedBox(height: AppDimensions.gapDescription),
                  AppTextField(hint: '••••••••', isPassword: true),
                  SizedBox(height: 32),
                  AppButton(text: 'Sign in', fullWidth: true),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: AppTypography.bodySmall.copyWith(color: AppColors.gray500),
                  ),
                  const SizedBox(width: 8),
                  const AppButton(text: 'Start a 14 day free trial', variant: AppButtonVariant.text),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
