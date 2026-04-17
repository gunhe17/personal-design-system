import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../../core/app_typography.dart';
import '../atoms/app_button.dart';
import '../atoms/app_text_field.dart';

class LoginandoutClone extends StatelessWidget {
  const LoginandoutClone({super.key});

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('Email address', isDark),
                  const SizedBox(height: AppDimensions.gapDescription),
                  const AppTextField(hint: 'gunhee@example.com'),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildLabel('Password', isDark),
                      const AppButton(text: 'Forgot password?', variant: AppButtonVariant.text),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.gapDescription),
                  const AppTextField(hint: '••••••••', isPassword: true),
                  const SizedBox(height: 32),
                  const AppButton(text: 'Sign in', fullWidth: true),
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

  Widget _buildLabel(String label, bool isDark) {
    return Text(
      label,
      style: AppTypography.labelMedium.copyWith(
        color: isDark ? Colors.white : AppColors.gray900,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
