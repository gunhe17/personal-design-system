import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../core/app_typography.dart';
import 'app_dotted_line.dart';
import 'app_icon_button.dart';
import 'app_tool_box.dart';

typedef ShowcaseEditLauncher = void Function(
  BuildContext context, {
  required String unitId,
  required List<String> targetFiles,
  required String label,
});

class AppShowcaseUnit extends StatelessWidget {
  final String label;
  final String? value;
  final Widget child;
  final double bottomPadding;
  final CrossAxisAlignment crossAxisAlignment;

  final String? unitId;
  final List<String>? targetFiles;

  static ShowcaseEditLauncher? editLauncher;

  const AppShowcaseUnit({
    super.key,
    required this.label,
    this.value,
    required this.child,
    this.bottomPadding = 40.0,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.unitId,
    this.targetFiles,
  });

  bool get _hasEditHooks =>
      kDebugMode &&
      unitId != null &&
      targetFiles != null &&
      targetFiles!.isNotEmpty &&
      editLauncher != null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: [
          _labelRow(context),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _labelRow(BuildContext context) {
    if (!_hasEditHooks) return _labelText(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _labelText(context),
        const SizedBox(width: 8),
        const Expanded(child: AppDottedLine()),
        const SizedBox(width: 8),
        AppToolBox(
          gap: 6,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          children: [
            AppIconButton(
              icon: Icons.auto_fix_high,
              size: 14,
              padding: const EdgeInsets.all(2),
              onPressed: () => editLauncher!(
                context,
                unitId: unitId!,
                targetFiles: targetFiles!,
                label: label,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _labelText(BuildContext context) {
    return Text(
      value != null ? '$label — $value' : label,
      style: AppTypography.labelSmall.copyWith(
        color: Theme.of(context).colorScheme.secondary,
        fontSize: 10,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
