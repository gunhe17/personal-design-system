import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../core/app_animations.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../../services/dev_edit_service.dart';
import '../atoms/app_button.dart';
import '../atoms/app_code_block.dart';
import '../atoms/app_diff_view.dart';
import '../atoms/app_drawer.dart';
import '../atoms/app_pill.dart';
import '../atoms/app_showcase_unit.dart';
import '../atoms/app_surface.dart';
import '../atoms/app_text_field.dart';
import 'version_history_list.dart';

class ShowcaseEditPanel extends StatefulWidget {
  final String unitId;
  final String label;
  final List<String> targetFiles;
  final DevEditService service;

  const ShowcaseEditPanel({
    super.key,
    required this.unitId,
    required this.label,
    required this.targetFiles,
    required this.service,
  });

  static void register({DevEditService? service}) {
    final s = service ?? DevEditService();
    AppShowcaseUnit.editLauncher = (context, {required unitId, required targetFiles, required label}) {
      assert(kDebugMode);
      AppDrawer.show(
        context,
        title: 'Edit: $label',
        child: ShowcaseEditPanel(
          unitId: unitId,
          label: label,
          targetFiles: targetFiles,
          service: s,
        ),
      );
    };
  }

  @override
  State<ShowcaseEditPanel> createState() => _ShowcaseEditPanelState();
}

enum _Phase { idle, sending, showingResult }

class _ShowcaseEditPanelState extends State<ShowcaseEditPanel> {
  final TextEditingController _controller = TextEditingController();
  _Phase _phase = _Phase.idle;
  String? _statusLabel;
  EditResult? _result;
  String? _error;
  List<VersionEntry> _history = const [];
  bool _rollbackBusy = false;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadHistory() async {
    try {
      final h = await widget.service.fetchHistory(widget.unitId);
      if (!mounted) return;
      setState(() => _history = h);
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = 'History: $e');
    }
  }

  Future<void> _apply() async {
    final prompt = _controller.text.trim();
    if (prompt.isEmpty) return;
    setState(() {
      _phase = _Phase.sending;
      _statusLabel = 'Running Claude...';
      _error = null;
      _result = null;
    });
    try {
      final r = await widget.service.sendEdit(
        unitId: widget.unitId,
        targetFiles: widget.targetFiles,
        prompt: prompt,
      );
      if (!mounted) return;
      setState(() {
        _phase = _Phase.showingResult;
        _result = r;
        _statusLabel = null;
      });
      _controller.clear();
      await _loadHistory();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _phase = _Phase.idle;
        _error = e.toString();
        _statusLabel = null;
      });
    }
  }

  Future<void> _rollback(VersionEntry v) async {
    setState(() {
      _rollbackBusy = true;
      _error = null;
    });
    try {
      final r = await widget.service.rollback(unitId: widget.unitId, versionId: v.versionId);
      if (!mounted) return;
      setState(() {
        _result = r;
        _phase = _Phase.showingResult;
      });
      await _loadHistory();
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = e.toString());
    } finally {
      if (mounted) {
        setState(() => _rollbackBusy = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              AppPill(text: widget.unitId),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Target files',
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.gray500,
              fontSize: 10,
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          AppCodeBlock(text: widget.targetFiles.join('\n')),
          const SizedBox(height: 24),

          Text(
            'Prompt',
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.gray500,
              fontSize: 10,
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          AppTextField(
            controller: _controller,
            hint: '예: hover 색상을 더 진하게 해줘',
            maxLines: 5,
          ),
          const SizedBox(height: 12),

          if (_statusLabel != null) ...[
            Row(
              children: [
                const SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.pointOrange),
                ),
                const SizedBox(width: 8),
                Text(_statusLabel!, style: AppTypography.bodySmall.copyWith(color: AppColors.gray500)),
              ],
            ),
            const SizedBox(height: 12),
          ],

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton(
                text: 'Apply',
                icon: Icons.send,
                onPressed: _phase == _Phase.sending ? null : _apply,
              ),
            ],
          ),

          if (_error != null) ...[
            const SizedBox(height: 16),
            AppSurface(
              color: isDark ? const Color(0x33EF4444) : const Color(0x1AEF4444),
              padding: const EdgeInsets.all(12),
              child: Text(
                _error!,
                style: AppTypography.bodySmall.copyWith(color: const Color(0xFFEF4444)),
              ),
            ),
          ],

          if (_result != null) ...[
            const SizedBox(height: 24),
            Text(
              'Result',
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.gray500,
                fontSize: 10,
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                AppPill(text: _result!.claudeExitCode == 0 ? 'SUCCESS' : 'EXIT ${_result!.claudeExitCode}'),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _result!.modifiedFiles.join(', '),
                    style: AppTypography.labelSmall.copyWith(color: AppColors.gray500, fontSize: 11),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (_result!.diff.trim().isEmpty)
              Text(
                'No file changes detected.',
                style: AppTypography.bodySmall.copyWith(color: AppColors.gray500),
              )
            else
              AppDiffView(diff: _result!.diff),
          ],

          const SizedBox(height: 32),
          Text(
            'History',
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.gray500,
              fontSize: 10,
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          VersionHistoryList(
            versions: _history,
            onRollback: _rollback,
            rollbackBusy: _rollbackBusy,
          ),
          SizedBox(height: AppAnimations.normal.inMilliseconds.toDouble() > 0 ? 40 : 40),
        ],
      ),
    );
  }
}
