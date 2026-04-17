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
import '../widgets/atoms/app_badge.dart';
import '../widgets/atoms/app_list_item.dart';
import '../widgets/atoms/app_description_item.dart';
import '../widgets/atoms/app_file_item.dart';
import '../widgets/atoms/app_stat_item.dart';
import '../widgets/atoms/app_pagination_item.dart';
import '../widgets/atoms/app_logo.dart';
import '../widgets/atoms/app_section_header.dart';
import '../widgets/atoms/app_pill.dart';
import '../widgets/atoms/app_surface.dart';
import '../widgets/atoms/app_showcase_unit.dart';
import '../widgets/clones/dropdowns_clone.dart';
import '../widgets/clones/selectmenus_clone.dart';
import '../widgets/clones/formlayouts_clone.dart';
import '../widgets/clones/loginandout_clone.dart';
import '../widgets/clones/stackedlists_clone.dart';
import '../widgets/clones/discriptionlists_clone.dart';
import '../widgets/clones/simplestats_clone.dart';
import '../widgets/clones/drawers_clone.dart';
import '../widgets/clones/pagination_clone.dart';
import '../widgets/clones/headers_clone.dart';
import '../widgets/clones/hero_clone.dart';
import '../widgets/clones/features_clone.dart';
import '../widgets/clones/bento_grid_clone.dart';
import '../widgets/clones/team_clone.dart';

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
                
                // --- 00. FOUNDATIONS ---
                _buildCategoryHeader(context, '00. Foundations', '디자인 시스템의 시각적 기초 및 전역 변수 설정입니다.'),
                _buildFoundationSection(context, '0.1', 'Theme Colors', '팔레트 및 포인트 그라데이션 정의', _buildThemeColorConfig(context)),
                _buildFoundationSection(context, '0.2', 'Typography Scale', '다국어 대응 텍스트 시스템 규격', _buildTypographyScale(context)),
                _buildFoundationSection(context, '0.3', 'Animation Tokens', '인터랙션 및 전환 효과 표준', _buildAnimationShowcase(context)),

                // --- 01. BASE ATOMS ---
                _buildCategoryHeader(context, '01. Base Atoms', '가장 기초적인 독립 인터랙션 부품들입니다.'),
                _buildFoundationSection(context, '1.1', 'Action Buttons', '아이콘 버튼 및 표준 버튼 변형', _buildButtonAtoms(context)),
                _buildFoundationSection(context, '1.2', 'Selection Controls', '체크박스 및 상태 전환 원자', _buildCheckboxAtoms(context)),

                // --- 02. DATA ATOMS ---
                _buildCategoryHeader(context, '02. Data Atoms', '정보를 시각적으로 구체화하는 작은 입자들입니다.'),
                _buildFoundationSection(context, '2.1', 'Identifiers', '아바타 및 통계 수치 표시 원자', _buildDataAtoms(context)),

                // --- 03. INPUT ATOMS ---
                _buildCategoryHeader(context, '03. Input Atoms', '정밀 정렬 및 무채색 강조가 적용된 입력 원자입니다.'),
                _buildFoundationSection(context, '3.1', 'Text Inputs', '표준 입력, 접두어 그룹 및 멀티라인 지원', _buildTextFieldAtoms(context)),

                // --- 04. STRUCTURAL UNITS ---
                _buildCategoryHeader(context, '04. Structural Units', '조합을 위한 기초 행(Row) 및 구조 단위 위젯입니다.'),
                _buildFoundationSection(context, '4.1', 'Information Rows', '표준 데이터 행 및 상세 정보 아이템', _buildStructuralAtoms(context)),
                _buildFoundationSection(context, '4.2', 'Pagination Units', '페이지 전환을 위한 최소 단위', _buildPaginationAtoms(context)),

                // --- 05. FUNCTIONAL COMBINATIONS ---
                _buildCategoryHeader(context, '05. Functional Combinations', '원자들이 결합되어 특정 기능을 수행하는 분자 단위입니다.'),
                _buildFoundationSection(context, '5.1', 'Interactive Menus', '정렬 옵션이 포함된 드롭다운 및 선택 메뉴', _buildMenuCombinations(context)),
                _buildFoundationSection(
                  context, 
                  '5.2', 
                  'Navigational Bars', 
                  '헤더 및 페이지네이션 바 조립 예시', 
                  const Column(
                    children: [
                      AppFrame(title: 'nav_header', child: HeadersClone()),
                      SizedBox(height: 32),
                      AppFrame(title: 'pagination', child: PaginationClone()),
                    ],
                  )
                ),

                // --- 06. SECTION TEMPLATES ---
                _buildCategoryHeader(context, '06. Section Templates', '원자 부품들이 조립된 기능적 대형 레이아웃입니다.'),
                _buildFoundationSection(context, '6.1', 'Data Sections', '목록, 통계 그리드, 상세 폼 등 섹션 템플릿', _buildSectionCombinations(context)),
                
                // --- 07. NAVIGATION & OVERLAYS ---
                _buildCategoryHeader(context, '07. Navigation & Overlays', '화면의 흐름과 공간을 제어하는 고수준 원자입니다.'),
                _buildFoundationSection(context, '7.1', 'Slide-overs', '사이드 패널 및 드로어 인터랙션', const DrawersClone()),

                // --- 08. FULL LAYOUTS ---
                _buildCategoryHeader(context, '08. Full Layouts', '모든 원자가 집약된 실제 서비스 화면 예시입니다.'),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildItemLabel(context, 'Hero Section', '8.1 Marketing Hero Template'),
                        const SizedBox(height: 24),
                        const AppFrame(title: 'hero', child: HeroClone()),
                        const SizedBox(height: 80),
                        _buildItemLabel(context, 'Profile Settings', '8.2 Settings Page Template'),
                        const SizedBox(height: 24),
                        const AppFrame(title: 'settings', child: FormlayoutsClone()),
                        const SizedBox(height: 80),
                        _buildItemLabel(context, 'Authentication', '8.3 Sign-in Page Template'),
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

  // --- HERO ---
  Widget _buildHeroSection(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 100, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppPill(text: 'ATOMIC SYSTEM v1.9'),
            const SizedBox(height: 24),
            Text('Achromatic & Point', style: AppTypography.displayLarge.copyWith(height: 1.0)),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: AppColors.pointGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds),
              child: Text('Logical Hierarchy', style: AppTypography.displayLarge.copyWith(color: AppColors.lightSurface, height: 1.1)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonAtoms(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShowcaseUnit(
          label: 'Primary', 
          child: AppButton(text: 'Primary Action', onPressed: () {}),
        ),
        AppShowcaseUnit(
          label: 'Secondary', 
          child: AppButton(text: 'Secondary', variant: AppButtonVariant.secondary, onPressed: () {}),
        ),
        AppShowcaseUnit(
          label: 'Icon', 
          child: AppButton(text: 'With Icon', icon: Icons.bolt, onPressed: () {}),
        ),
        AppShowcaseUnit(
          label: 'Text Link', 
          child: AppButton(text: 'Text Link', variant: AppButtonVariant.text, onPressed: () {}),
        ),
      ],
    );
  }

  Widget _buildCheckboxAtoms(BuildContext context) {
    return AppShowcaseUnit(
      label: 'Standard', 
      child: AppCheckbox(initialValue: true, onChanged: (v){}, title: 'Interactive Switch', description: 'Neutral gray toggle state.'),
    );
  }

  Widget _buildDataAtoms(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShowcaseUnit(
          label: 'Avatar', 
          child: AppAvatar(imageUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80', size: 56, isOnline: true),
        ),
        AppShowcaseUnit(
          label: 'Logo with Text', 
          child: AppLogo(size: 40),
        ),
        AppShowcaseUnit(
          label: 'Logo Only', 
          child: AppLogo(size: 40, showText: false),
        ),
        AppShowcaseUnit(
          label: 'Notification Badge', 
          child: AppBadge(variant: AppBadgeVariant.notification, size: 12),
        ),
        AppShowcaseUnit(
          label: 'Dot Badge', 
          child: AppBadge(variant: AppBadgeVariant.dot, size: 10),
        ),
        AppShowcaseUnit(
          label: 'Pill', 
          child: AppPill(text: 'NEW'),
        ),
        AppShowcaseUnit(
          label: 'Stat Item', 
          child: AppStatItem(label: 'Global Transactions', value: '44 Million'),
        ),
      ],
    );
  }

  Widget _buildTextFieldAtoms(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShowcaseUnit(
          label: 'Standard', 
          child: AppTextField(hint: 'Standard Input Field'),
        ),
        AppShowcaseUnit(
          label: 'With Prefix', 
          child: AppTextField(prefix: 'workcation.com/', hint: 'janesmith'),
        ),
        AppShowcaseUnit(
          label: 'TextArea', 
          child: AppTextField(hint: 'TextArea', maxLines: 3),
        ),
      ],
    );
  }

  Widget _buildStructuralAtoms(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppShowcaseUnit(
          label: 'List Item',
          child: AppSurface(
            child: AppListItem(
              onTap: () {},
              leading: const AppAvatar(imageUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80', size: 40),
              title: 'Dries Vincent',
              subtitle: 'dries.vincent@example.com',
              trailing: const Icon(Icons.chevron_right, color: AppColors.gray400, size: 20),
            ),
          ),
        ),
        const AppShowcaseUnit(
          label: 'Description Item',
          child: AppSurface(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: AppDescriptionItem(
              label: 'Role', 
              content: Text('Director of Product', style: TextStyle(color: AppColors.gray500, fontSize: 14)),
            ),
          ),
        ),
        AppShowcaseUnit(
          label: 'File Item',
          child: AppSurface(
            child: AppFileItem(fileName: 'resume_v2.pdf', fileSize: '4.2mb', onDownload: () {}),
          ),
        ),
      ],
    );
  }

  Widget _buildPaginationAtoms(BuildContext context) {
    return Row(
      children: [
        AppPaginationItem(text: '1', isActive: true, isFirst: true, onTap: () {}),
        AppPaginationItem(text: '2', onTap: () {}),
        AppPaginationItem(icon: const Icon(Icons.chevron_right, size: 18), isLast: true, onTap: () {}),
      ],
    );
  }

  Widget _buildMenuCombinations(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemLabel(context, 'Dropdown', 'Alignment Strategy'),
        const SizedBox(height: 24),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownsClone(alignment: DropdownAlignment.left, title: 'Left'),
            DropdownsClone(alignment: DropdownAlignment.center, title: 'Center'),
            DropdownsClone(alignment: DropdownAlignment.right, title: 'Right'),
          ],
        ),
        const SizedBox(height: 48),
        _buildItemLabel(context, 'Select Menu', 'Avatar Data Selection'),
        const SizedBox(height: 24),
        const SelectmenusClone(),
      ],
    );
  }

  Widget _buildSectionCombinations(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppFrame(title: 'bento_grid', child: BentoGridClone()),
        const SizedBox(height: 80),
        _buildItemLabel(context, 'Features Grid', '6.1.1 Icon & Grid System'),
        const SizedBox(height: 24),
        const FeaturesClone(),
        const SizedBox(height: 80),
        _buildItemLabel(context, 'Stacked List', '6.1.2 High Density Table'),
        const SizedBox(height: 24),
        const StackedlistsClone(),
        const SizedBox(height: 80),
        _buildItemLabel(context, 'Statistics', '6.1.3 Responsive Numerical Grid'),
        const SizedBox(height: 24),
        const SimplestatsClone(),
        const SizedBox(height: 80),
        _buildItemLabel(context, 'Description List', '6.1.4 Structured Information'),
        const SizedBox(height: 24),
        const DiscriptionlistsClone(),
        const SizedBox(height: 80),
        _buildItemLabel(context, 'Team Section', '6.1.5 Leadership Grid'),
        const SizedBox(height: 24),
        const TeamClone(),
        const SizedBox(height: 80),
      ],
    );
  }

  // --- STANDARD HELPERS ---

  Widget _buildCategoryHeader(BuildContext context, String title, String description) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 120, 24, 40),
        child: AppSectionHeader(title: title, description: description),
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
    return AppSectionHeader(
      title: name,
      description: detail,
      variant: AppSectionHeaderVariant.item,
    );
  }

  Widget _buildThemeColorConfig(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemLabel(context, 'Point Colors', 'Primary & Secondary Accents'),
        const SizedBox(height: 24),
        AppShowcaseUnit(
          label: 'Orange',
          child: Container(width: 56, height: 56, decoration: const BoxDecoration(color: AppColors.pointOrange, shape: BoxShape.circle)),
        ),
        AppShowcaseUnit(
          label: 'Gold',
          child: Container(width: 56, height: 56, decoration: const BoxDecoration(color: AppColors.pointGold, shape: BoxShape.circle)),
        ),
        const SizedBox(height: 48),
        _buildItemLabel(context, 'Achromatic Palette', 'Neutral Grayscale'),
        const SizedBox(height: 24),
        AppShowcaseUnit(
          label: 'Gray Scale',
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: AppColors.palette.map((color) => Container(
              width: 44, 
              height: 44, 
              decoration: BoxDecoration(color: color, shape: BoxShape.circle, border: Border.all(color: Theme.of(context).colorScheme.outline, width: 2))
            )).toList(),
          ),
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
        ...items.map((item) => AppShowcaseUnit(
          label: item.$1,
          value: '${item.$2.fontSize?.toInt()}px',
          child: Text('디자인은 어떻게 작동하는지입니다. Design is how it works.', style: item.$2),
        )),
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
}
