import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_typography.dart';
import '../core/app_dimensions.dart';
import '../core/app_animations.dart';
import '../widgets/app_frame.dart';
import '../widgets/atoms/app_button.dart';
import '../widgets/atoms/app_text_field.dart';
import '../widgets/atoms/app_checkbox.dart';
import '../widgets/atoms/app_avatar.dart';
import '../widgets/atoms/app_list_item.dart';
import '../widgets/atoms/app_description_item.dart';
import '../widgets/atoms/app_file_item.dart';
import '../widgets/clones/dropdowns_clone.dart';
import '../widgets/clones/selectmenus_clone.dart';
import '../widgets/clones/formlayouts_clone.dart';
import '../widgets/clones/loginandout_clone.dart';
import '../widgets/clones/stackedlists_clone.dart';
import '../widgets/clones/discriptionlists_clone.dart';
import 'example_profile_page.dart';

class ShowcasePage extends StatefulWidget {
  const ShowcasePage({super.key});

  @override
  State<ShowcasePage> createState() => _ShowcasePageState();
}

class _ShowcasePageState extends State<ShowcasePage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppDimensions.contentMaxWidth),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: CustomScrollView(
              slivers: [
                _buildHeroSection(context),
                
                _buildCategoryHeader(context, '00. Foundations', '디자인 시스템의 시각적 기초 요소입니다.'),
                _buildFoundationSection(context, '0.1', 'Theme Colors', '팔레트 및 그라데이션 정의', _buildThemeColorConfig(context)),
                _buildFoundationSection(context, '0.2', 'Typography Scale', '텍스트 시스템 규격', _buildTypographyScale(context)),
                _buildFoundationSection(context, '0.3', 'Animation Tokens', '인터랙션 및 전환 효과', _buildAnimationShowcase(context)),

                _buildCategoryHeader(context, '01. Atoms', '시스템을 구성하는 최소 단위의 위젯들입니다.'),
                _buildFoundationSection(context, '1.1', 'App Button', '시각적 위계에 따른 컬러 이원화', _buildButtonAtoms(context)),
                _buildFoundationSection(context, '1.2', 'App Text Field', '표준 입력, 접두어, 멀티라인 지원', _buildTextFieldAtoms(context)),
                _buildFoundationSection(context, '1.3', 'App Checkbox', '상태 전환이 가능한 인터랙티브 원자', _buildCheckboxAtoms(context)),
                _buildFoundationSection(context, '1.4', 'App Avatar', '프로필 이미지 및 상태 표시 원자', _buildAvatarAtoms(context)),
                _buildFoundationSection(context, '1.5', 'App List Item', '표준 데이터 행 위젯', _buildListItemAtoms(context)),
                _buildFoundationSection(context, '1.6', 'App Description Item', '키-값 쌍의 데이터 표시 원자', _buildDescriptionAtoms(context)),
                _buildFoundationSection(context, '1.7', 'App File Item', '첨부파일 및 다운로드 액션 행 위젯', _buildFileAtoms(context)),

                _buildCategoryHeader(context, '02. Functional Combinations', '원자 단위 위젯들이 조합된 기능적 레이아웃입니다.'),
                _buildFoundationSection(context, '2.1', 'Dropdown Menu', '정렬 옵션이 포함된 드롭다운', _buildDropdownShowcase(context)),
                _buildFoundationSection(context, '2.2', 'Select Menu', '아바타 리스트 선택', const SelectmenusClone()),
                _buildFoundationSection(context, '2.3', 'Stacked List', '데이터 목록 및 상태 표시 조합', const StackedlistsClone()),
                _buildFoundationSection(context, '2.4', 'Description List', '상세 정보 리스트 조합', const DiscriptionlistsClone()),
                
                _buildCategoryHeader(context, '03. Full Layouts', '원자 부품들이 조립된 완성형 페이지 레이아웃입니다.'),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildItemLabel(context, 'Profile Settings', '3.1 Form Layout Clone'),
                        const SizedBox(height: 24),
                        const AppFrame(title: 'settings', child: FormlayoutsClone()),
                        const SizedBox(height: 80),
                        _buildItemLabel(context, 'Authentication', '3.2 Login Page Clone'),
                        const SizedBox(height: 24),
                        const AppFrame(title: 'auth', child: LoginandoutClone()),
                      ],
                    ),
                  ),
                ),
                
                const SliverPadding(padding: EdgeInsets.only(bottom: 120)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.pointOrange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
              ),
              child: Text('ATOMIC DESIGN v1.7', style: AppTypography.labelSmall.copyWith(color: AppColors.pointOrange, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            Text('Achromatic & Point', style: AppTypography.displayLarge),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(colors: AppColors.pointGradient).createShader(bounds),
              child: Text('Modular Showcase', style: AppTypography.displayLarge.copyWith(color: AppColors.lightSurface)),
            ),
          ],
        ),
      ),
    );
  }

  // --- ATOM SHOWCASES ---

  Widget _buildButtonAtoms(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemLabel(context, 'Point Variant', 'Primary CTA Action'),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            AppButton(text: 'Primary Button', onPressed: () {}),
            AppButton(text: 'Action with Icon', icon: Icons.bolt, onPressed: () {}),
          ],
        ),
        const SizedBox(height: 48),
        _buildItemLabel(context, 'Achromatic Variants', 'Secondary & Support Actions'),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            AppButton(text: 'Secondary', variant: AppButtonVariant.secondary, onPressed: () {}),
            AppButton(text: 'Ghost Text', variant: AppButtonVariant.text, onPressed: () {}),
            AppButton(text: 'Text w/ Icon', variant: AppButtonVariant.text, icon: Icons.arrow_forward, onPressed: () {}),
            const AppButton(text: 'Disabled', onPressed: null),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldAtoms(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemLabel(context, 'Text Input Fields', 'Standard & Grouped Types'),
        const SizedBox(height: 20),
        const Column(
          children: [
            AppTextField(hint: 'Standard Input (Neutral Gray Focus)'),
            SizedBox(height: 16),
            AppTextField(prefix: 'workcation.com/', hint: 'janesmith', helperText: 'Username with achromatic baseline sync.'),
            SizedBox(height: 16),
            AppTextField(hint: 'TextArea (Unified cursor height)', maxLines: 3),
          ],
        ),
      ],
    );
  }

  Widget _buildCheckboxAtoms(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemLabel(context, 'Checkbox Atom', 'Interactive Component State'),
        const SizedBox(height: 20),
        AppCheckbox(initialValue: true, onChanged: (v){}, title: 'Interactive Checked', description: 'Neutral gray background when active.'),
        const SizedBox(height: 16),
        AppCheckbox(initialValue: false, onChanged: (v){}, title: 'Interactive Unchecked', description: 'Clean border-only state.'),
      ],
    );
  }

  Widget _buildAvatarAtoms(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemLabel(context, 'Avatar Variants', 'Sizes & Online Indicators'),
        const SizedBox(height: 20),
        const Wrap(
          spacing: 24,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            AppAvatar(imageUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80', size: 64, isOnline: true),
            AppAvatar(imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80', size: 48),
            AppAvatar(imageUrl: 'https://images.unsplash.com/photo-1519244703995-f4e0f30006d5?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80', size: 32, isOnline: true),
          ],
        ),
      ],
    );
  }

  Widget _buildListItemAtoms(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemLabel(context, 'List Item Atom', 'Building block for data lists'),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          ),
          child: AppListItem(
            onTap: () {}, // 클릭 이벤트 명시 (애니메이션 활성화용)
            leading: const AppAvatar(imageUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80', size: 40),
            title: 'Dries Vincent',
            subtitle: 'dries.vincent@example.com',
            trailing: const Icon(Icons.chevron_right, color: AppColors.gray500),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionAtoms(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemLabel(context, 'Description Item', 'Standard key-value row'),
        const SizedBox(height: 20),
        const AppDescriptionItem(
          label: 'Salary expectation',
          content: Text('\$120,000', style: TextStyle(color: AppColors.gray400)),
        ),
      ],
    );
  }

  Widget _buildFileAtoms(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemLabel(context, 'File Item Atom', 'Standard attachment row'),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          ),
          child: AppFileItem(
            fileName: 'portfolio_design.pdf', 
            fileSize: '12.8mb', 
            onDownload: () {}
          ),
        ),
      ],
    );
  }

  // --- HELPERS ---

  Widget _buildCategoryHeader(BuildContext context, String title, String description) {
    final colorScheme = Theme.of(context).colorScheme;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(width: 4, height: 24, color: AppColors.pointOrange),
                const SizedBox(width: 12),
                Text(title.toUpperCase(), style: AppTypography.headlineSmall.copyWith(fontWeight: FontWeight.w800)),
              ],
            ),
            const SizedBox(height: 8),
            Text(description, style: AppTypography.bodySmall.copyWith(color: colorScheme.secondary)),
            const SizedBox(height: 16),
            Divider(color: colorScheme.outline, thickness: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildFoundationSection(BuildContext context, String index, String name, String description, Widget widget) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(index, style: AppTypography.labelSmall.copyWith(color: AppColors.pointOrange, fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                Text(name, style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w800)),
              ],
            ),
            const SizedBox(height: 8),
            Text(description, style: AppTypography.bodySmall.copyWith(color: Theme.of(context).colorScheme.secondary)),
            const SizedBox(height: 32),
            widget,
          ],
        ),
      ),
    );
  }

  Widget _buildItemLabel(BuildContext context, String name, String detail) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(detail, style: AppTypography.labelSmall.copyWith(color: colorScheme.secondary.withOpacity(0.6), fontSize: 10, letterSpacing: 1.0, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(name, style: AppTypography.titleMedium.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildThemeColorConfig(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemLabel(context, 'Point Colors', 'Primary & Secondary Accents'),
        const SizedBox(height: 24),
        Wrap(
          spacing: 40,
          children: [
            _buildConfigItem(context, 'Orange', Container(width: 56, height: 56, decoration: const BoxDecoration(color: AppColors.pointOrange, shape: BoxShape.circle))),
            _buildConfigItem(context, 'Gold', Container(width: 56, height: 56, decoration: const BoxDecoration(color: AppColors.pointGold, shape: BoxShape.circle))),
          ],
        ),
        const SizedBox(height: 48),
        _buildItemLabel(context, 'Achromatic Palette', 'Neutral Grayscale'),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: AppColors.palette.map((color) => Container(
            width: 44, 
            height: 44, 
            decoration: BoxDecoration(color: color, shape: BoxShape.circle, border: Border.all(color: Theme.of(context).colorScheme.outline, width: 2))
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildTypographyScale(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTypographyRow(context, 'Display', [('Large', AppTypography.displayLarge), ('Medium', AppTypography.displayMedium)]),
        const SizedBox(height: 48),
        _buildTypographyRow(context, 'Headline', [('Large', AppTypography.headlineLarge), ('Medium', AppTypography.headlineMedium)]),
        const SizedBox(height: 48),
        _buildTypographyRow(context, 'Title', [('Large', AppTypography.titleLarge), ('Medium', AppTypography.titleMedium)]),
        const SizedBox(height: 48),
        _buildTypographyRow(context, 'Body', [('Large', AppTypography.bodyLarge), ('Medium', AppTypography.bodyMedium)]),
      ],
    );
  }

  Widget _buildTypographyRow(BuildContext context, String category, List<(String, TextStyle)> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemLabel(context, category, 'Typography Scale'),
        const SizedBox(height: 24),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${item.$1} — ${item.$2.fontSize?.toInt()}px', style: AppTypography.labelSmall.copyWith(color: Theme.of(context).colorScheme.secondary, fontSize: 10)),
              const SizedBox(height: 8),
              Text('디자인은 어떻게 작동하는지입니다. Design is how it works.', style: item.$2),
            ],
          ),
        )).toList(),
      ],
    );
  }

  Widget _buildAnimationShowcase(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemLabel(context, 'Durations', 'Transition Speed Scale'),
        const SizedBox(height: 24),
        Row(
          children: [
            _buildAnimationTokenItem(context, 'Fast', '${AppAnimations.fast.inMilliseconds}ms'),
            const SizedBox(width: 40),
            _buildAnimationTokenItem(context, 'Normal', '${AppAnimations.normal.inMilliseconds}ms'),
          ],
        ),
        const SizedBox(height: 48),
        _buildItemLabel(context, 'Interaction', 'Subtle Feedback (Ripple)'),
        const SizedBox(height: 24),
        // 인터랙션 테스트 버튼 무채색으로 수정
        AppButton(text: 'Click to test ripple', variant: AppButtonVariant.secondary, onPressed: () {}),
      ],
    );
  }

  Widget _buildAnimationTokenItem(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: AppTypography.headlineSmall.copyWith(color: AppColors.pointOrange)),
        const SizedBox(height: 4),
        Text(label, style: AppTypography.labelSmall.copyWith(color: Theme.of(context).colorScheme.secondary, fontSize: 10, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildDropdownShowcase(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemLabel(context, 'Alignment Options', 'Menu Positioning Strategy'),
        const SizedBox(height: 32),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownsClone(alignment: DropdownAlignment.left, title: 'Left'),
            DropdownsClone(alignment: DropdownAlignment.center, title: 'Center'),
            DropdownsClone(alignment: DropdownAlignment.right, title: 'Right'),
          ],
        ),
      ],
    );
  }

  Widget _buildConfigItem(BuildContext context, String label, Widget widget) {
    return Column(
      children: [
        widget,
        const SizedBox(height: 12),
        Text(label, style: AppTypography.labelSmall.copyWith(color: Theme.of(context).colorScheme.secondary, fontSize: 10)),
      ],
    );
  }
}
