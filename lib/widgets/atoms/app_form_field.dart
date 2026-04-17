import 'package:flutter/material.dart';
import 'app_field_label.dart';
import 'app_text_field.dart';

class AppFormField extends StatelessWidget {
  final String label;
  final String hint;
  final String? prefix;
  final int maxLines;
  final bool isPassword;
  final String? helperText;

  const AppFormField({
    super.key,
    required this.label,
    this.hint = '',
    this.prefix,
    this.maxLines = 1,
    this.isPassword = false,
    this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppFieldLabel(label: label),
        const SizedBox(height: 8),
        AppTextField(
          hint: hint,
          prefix: prefix,
          maxLines: maxLines,
          isPassword: isPassword,
          helperText: helperText,
        ),
      ],
    );
  }
}
