import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_typography.dart';
import '../core/app_dimensions.dart';

class ShowcasePage extends StatelessWidget {
  const ShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppDimensions.contentMaxWidth),
          child: CustomScrollView(
            slivers: [
              _buildHeroSection(),
              
              _buildCategoryHeader('01. Foundations', 'The core visual DNA: tokens that define the overall look and feel.'),
              _buildFoundationSection('1.1', 'Color Palette', _buildColorPalette()),
              _buildFoundationSection('1.2', 'Typography Scale', _buildTypographyScale()),

              _buildCategoryHeader('02. Actions', 'Functional triggers that allow users to perform tasks and navigate.'),
              
              // 2.1 Common Button Matrix
              _buildComponentSection(
                index: '2.1',
                name: 'Common Button',
                description: 'Primary action trigger with consistent size levels (S/M/L) and emphasis styles.',
                rows: [
                  _buildSpecRow('SIZES', [
                    _buildExample(_buildButton(size: AppDimensions.heightSmall, label: 'Small Button'), 'Small (32px)'),
                    _buildExample(_buildButton(size: AppDimensions.heightMedium, label: 'Medium Button'), 'Medium (40px)'),
                    _buildExample(_buildButton(size: AppDimensions.heightLarge, label: 'Large Button'), 'Large (48px)'),
                  ]),
                  _buildSpecRow('STYLES', [
                    _buildExample(FilledButton(onPressed: () {}, child: const Text('Filled')), 'Filled'),
                    _buildExample(OutlinedButton(onPressed: () {}, child: const Text('Outlined')), 'Outlined'),
                    _buildExample(FilledButton.tonal(onPressed: () {}, child: const Text('Tonal')), 'Tonal'),
                  ]),
                ],
              ),

              _buildCategoryHeader('03. Inputs', 'Data entry components organized by standardized dimensions for consistent layouts.'),
              
              // 3.1 Text Field Matrix
              _buildComponentSection(
                index: '3.1',
                name: 'Text Field',
                description: 'Standardized input field with consistent width and padding across states.',
                rows: [
                  _buildSpecRow('SIZES', [
                    _buildExample(_buildTextField(width: AppDimensions.inputWidthNarrow, label: 'Narrow Input'), 'Narrow (160px)'),
                    _buildExample(_buildTextField(width: AppDimensions.inputWidthStandard, label: 'Standard Input'), 'Standard (320px)'),
                  ]),
                  _buildSpecRow('STATES', [
                    _buildExample(_buildTextField(width: AppDimensions.inputWidthStandard, label: 'Error State', error: 'Invalid input'), 'Error'),
                    _buildExample(_buildTextField(width: AppDimensions.inputWidthStandard, label: 'Disabled State', enabled: false), 'Disabled'),
                  ]),
                ],
              ),

              _buildCategoryHeader('04. Feedback', 'Consistent visual cues for process status and notification.'),
              
              _buildComponentSection(
                index: '4.1',
                name: 'Progress Indicator',
                description: 'Visual feedback for loading or processing states with size consistency.',
                rows: [
                  _buildSpecRow('SIZES', [
                    _buildExample(const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2)), 'Small (24px)'),
                    _buildExample(const SizedBox(width: 40, height: 40, child: CircularProgressIndicator(strokeWidth: 3)), 'Medium (40px)'),
                    _buildExample(const LinearProgressIndicator(), 'Full Width (Linear)'),
                  ]),
                ],
              ),
              
              const SliverPadding(padding: EdgeInsets.only(bottom: 120)),
            ],
          ),
        ),
      ),
    );
  }

  // --- Widget Builders for Consistency ---

  Widget _buildButton({required double size, required String label}) {
    return SizedBox(
      height: size,
      child: FilledButton(onPressed: () {}, child: Text(label)),
    );
  }

  Widget _buildTextField({required double width, required String label, String? error, bool enabled = true}) {
    return SizedBox(
      width: width,
      child: TextField(
        enabled: enabled,
        decoration: InputDecoration(
          labelText: label,
          errorText: error,
          border: const OutlineInputBorder(),
          isDense: true,
        ),
      ),
    );
  }

  // --- Layout Helper Widgets ---

  Widget _buildHeroSection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('DESIGN SYSTEM v1.0', style: AppTypography.labelSmall),
            const SizedBox(height: 16),
            const Text('Visual Spec Showcase', style: AppTypography.displayLarge),
            const SizedBox(height: 16),
            Text(
              'A visual matrix of components and their various states,\norganized by functional attributes and data types.',
              style: AppTypography.bodyMedium.copyWith(color: AppColors.secondary, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryHeader(String title, String description) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 100, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(color: Colors.black, thickness: 2),
            const SizedBox(height: 24),
            Text(title.toUpperCase(), style: AppTypography.headlineMedium.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.5)),
            const SizedBox(height: 12),
            Text(description, style: AppTypography.bodyMedium.copyWith(color: AppColors.secondary)),
          ],
        ),
      ),
    );
  }

  Widget _buildFoundationSection(String index, String name, Widget widget) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(index, style: AppTypography.labelSmall.copyWith(fontWeight: FontWeight.w900)),
                const SizedBox(width: 8),
                Text(name, style: AppTypography.titleLarge),
              ],
            ),
            const SizedBox(height: 32),
            widget,
          ],
        ),
      ),
    );
  }

  Widget _buildComponentSection({
    required String index,
    required String name,
    required String description,
    required List<Widget> rows,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(index, style: AppTypography.labelSmall.copyWith(fontWeight: FontWeight.w900)),
                const SizedBox(width: 8),
                Text(name, style: AppTypography.titleLarge.copyWith(fontSize: 32)),
              ],
            ),
            const SizedBox(height: 12),
            Text(description, style: AppTypography.bodyMedium.copyWith(color: AppColors.secondary)),
            const SizedBox(height: 48),
            ...rows,
          ],
        ),
      ),
    );
  }

  Widget _buildSpecRow(String label, List<Widget> examples) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.labelSmall.copyWith(fontSize: 10, letterSpacing: 1.5, color: Colors.black38)),
          const SizedBox(height: 24),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: examples,
          ),
          const SizedBox(height: 24),
          const Divider(color: Colors.black12),
        ],
      ),
    );
  }

  Widget _buildExample(Widget widget, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget,
        const SizedBox(height: 12),
        Text(label, style: AppTypography.labelSmall.copyWith(fontSize: 9, color: AppColors.secondary)),
      ],
    );
  }

  Widget _buildColorPalette() {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: AppColors.palette.map((color) => _buildExample(
        Container(width: 60, height: 60, decoration: BoxDecoration(color: color, shape: BoxShape.circle, border: Border.all(color: Colors.black12))),
        color.value.toRadixString(16).toUpperCase().replaceAll('FF', '#')
      )).toList(),
    );
  }

  Widget _buildTypographyScale() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExample(const Text('Display Large', style: AppTypography.displayLarge), 'Display L'),
        const SizedBox(height: 24),
        _buildExample(const Text('Headline Medium', style: AppTypography.headlineMedium), 'Headline M'),
        const SizedBox(height: 24),
        _buildExample(const Text('Title Large', style: AppTypography.titleLarge), 'Title L'),
        const SizedBox(height: 24),
        _buildExample(const Text('Body Medium - System Scale.', style: AppTypography.bodyMedium), 'Body M'),
      ],
    );
  }
}
