import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_typography.dart';
import '../core/app_dimensions.dart';
import '../core/app_animations.dart';
import '../widgets/app_frame.dart';
// Atoms
import '../widgets/atoms/app_announcement_badge.dart';
import '../widgets/atoms/app_avatar.dart';
import '../widgets/atoms/app_avatar_group.dart';
import '../widgets/atoms/app_badge.dart';
import '../widgets/atoms/app_bento_box.dart';
import '../widgets/atoms/app_blog_card.dart';
import '../widgets/atoms/app_button.dart';
import '../widgets/atoms/app_checkbox.dart';
import '../widgets/atoms/app_code_block.dart';
import '../widgets/atoms/app_description_item.dart';
import '../widgets/atoms/app_diff_view.dart';
import '../widgets/atoms/app_dotted_line.dart';
import '../widgets/atoms/app_feature_item.dart';
import '../widgets/atoms/app_field_label.dart';
import '../widgets/atoms/app_file_item.dart';
import '../widgets/atoms/app_form_field.dart';
import '../widgets/atoms/app_icon_box.dart';
import '../widgets/atoms/app_icon_button.dart';
import '../widgets/atoms/app_image_placeholder.dart';
import '../widgets/atoms/app_inactive_placeholder.dart';
import '../widgets/atoms/app_list_item.dart';
import '../widgets/atoms/app_logo.dart';
import '../widgets/atoms/app_pagination_item.dart';
import '../widgets/atoms/app_pill.dart';
import '../widgets/atoms/app_pricing_card.dart';
import '../widgets/atoms/app_select_option.dart';
import '../widgets/atoms/app_select_trigger.dart';
import '../widgets/atoms/app_showcase_unit.dart';
import '../widgets/atoms/app_stat_item.dart';
import '../widgets/atoms/app_status_indicator.dart';
import '../widgets/atoms/app_surface.dart';
import '../widgets/atoms/app_team_member_card.dart';
import '../widgets/atoms/app_text_field.dart';
import '../widgets/atoms/app_toggle.dart';
import '../widgets/atoms/app_tool_box.dart';
// Molecules
import '../widgets/molecules/app_dropdown.dart';
import '../widgets/molecules/app_pagination_bar.dart';
import '../widgets/molecules/app_select_menu.dart';
import '../widgets/molecules/app_slide_over.dart';
// Organisms
import '../widgets/organisms/app_auth.dart';
import '../widgets/organisms/app_bento_grid.dart';
import '../widgets/organisms/app_blog_section.dart';
import '../widgets/organisms/app_contact_section.dart';
import '../widgets/organisms/app_content_section.dart';
import '../widgets/organisms/app_cta_section.dart';
import '../widgets/organisms/app_description_list.dart';
import '../widgets/organisms/app_features.dart';
import '../widgets/organisms/app_form_layout.dart';
import '../widgets/organisms/app_header.dart';
import '../widgets/organisms/app_hero.dart';
import '../widgets/organisms/app_newsletter_section.dart';
import '../widgets/organisms/app_pricing_section.dart';
import '../widgets/organisms/app_product_section.dart';
import '../widgets/organisms/app_stacked_list.dart';
import '../widgets/organisms/app_stats_section.dart';
import '../widgets/organisms/app_team_section.dart';

// Relative paths from project root used as targets for the local edit feature.
const _pColors = 'lib/core/app_colors.dart';
const _pTypography = 'lib/core/app_typography.dart';
const _pAnimations = 'lib/core/app_animations.dart';
const _pButton = 'lib/widgets/atoms/app_button.dart';
const _pIconButton = 'lib/widgets/atoms/app_icon_button.dart';
const _pCheckbox = 'lib/widgets/atoms/app_checkbox.dart';
const _pToggle = 'lib/widgets/atoms/app_toggle.dart';
const _pIconBox = 'lib/widgets/atoms/app_icon_box.dart';
const _pBadge = 'lib/widgets/atoms/app_badge.dart';
const _pPill = 'lib/widgets/atoms/app_pill.dart';
const _pStatusIndicator = 'lib/widgets/atoms/app_status_indicator.dart';
const _pAnnouncementBadge = 'lib/widgets/atoms/app_announcement_badge.dart';
const _pAvatar = 'lib/widgets/atoms/app_avatar.dart';
const _pAvatarGroup = 'lib/widgets/atoms/app_avatar_group.dart';
const _pLogo = 'lib/widgets/atoms/app_logo.dart';
const _pStatItem = 'lib/widgets/atoms/app_stat_item.dart';
const _pBlogCard = 'lib/widgets/atoms/app_blog_card.dart';
const _pTeamMemberCard = 'lib/widgets/atoms/app_team_member_card.dart';
const _pPricingCard = 'lib/widgets/atoms/app_pricing_card.dart';
const _pFeatureItem = 'lib/widgets/atoms/app_feature_item.dart';
const _pImagePlaceholder = 'lib/widgets/atoms/app_image_placeholder.dart';
const _pInactivePlaceholder = 'lib/widgets/atoms/app_inactive_placeholder.dart';
const _pToolBox = 'lib/widgets/atoms/app_tool_box.dart';
const _pDottedLine = 'lib/widgets/atoms/app_dotted_line.dart';
const _pTextField = 'lib/widgets/atoms/app_text_field.dart';
const _pFieldLabel = 'lib/widgets/atoms/app_field_label.dart';
const _pFormField = 'lib/widgets/atoms/app_form_field.dart';
const _pSelectTrigger = 'lib/widgets/atoms/app_select_trigger.dart';
const _pSelectOption = 'lib/widgets/atoms/app_select_option.dart';
const _pListItem = 'lib/widgets/atoms/app_list_item.dart';
const _pDescriptionItem = 'lib/widgets/atoms/app_description_item.dart';
const _pFileItem = 'lib/widgets/atoms/app_file_item.dart';
const _pBentoBox = 'lib/widgets/atoms/app_bento_box.dart';
const _pCodeBlock = 'lib/widgets/atoms/app_code_block.dart';
const _pDiffView = 'lib/widgets/atoms/app_diff_view.dart';
const _pDropdown = 'lib/widgets/molecules/app_dropdown.dart';

class ShowcasePage extends StatefulWidget {
  const ShowcasePage({super.key});

  @override
  State<ShowcasePage> createState() => _ShowcasePageState();
}

class _ShowcasePageState extends State<ShowcasePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // --- NEW BADGES ---
  static const _newItems = {'A.3', 'A.4', 'A.5', 'A.6', 'A.8', 'A.11'};

  // --- TOC DATA PER TAB ---
  static const _foundationsToc = [
    ('F.1', 'Theme Colors'),
    ('F.2', 'Typography Scale'),
    ('F.3', 'Animation Tokens'),
  ];

  static const _atomsToc = [
    ('A.1', 'Action Buttons'),
    ('A.2', 'Selection Controls'),
    ('A.3', 'Indicators & Containers'),
    ('A.4', 'Identifiers'),
    ('A.5', 'Cards'),
    ('A.6', 'Composites'),
    ('A.7', 'Text Inputs'),
    ('A.8', 'Form Controls'),
    ('A.9', 'Information Rows'),
    ('A.10', 'Pagination Units'),
    ('A.11', 'Content Blocks'),
  ];

  static const _moleculesToc = [
    ('M.1', 'Dropdowns'),
    ('M.2', 'Select Menus'),
    ('M.3', 'Pagination Bar'),
    ('M.4', 'Drawers'),
  ];

  static const _organismsToc = [
    ('O.1', 'Headers'),
    ('O.2', 'Hero'),
    ('O.3', 'Features'),
    ('O.4', 'Content Section'),
    ('O.5', 'Product Section'),
    ('O.6', 'Blog Section'),
    ('O.7', 'Team Section'),
    ('O.8', 'Statistics'),
    ('O.9', 'Stacked Lists'),
    ('O.10', 'Description Lists'),
    ('O.11', 'Bento Grid'),
    ('O.12', 'Pricing'),
    ('O.13', 'CTA'),
    ('O.14', 'Newsletter'),
    ('O.15', 'Contact'),
    ('O.16', 'Form Layouts'),
    ('O.17', 'Authentication'),
  ];

  // --- GLOBAL KEYS ---
  final Map<String, GlobalKey> _keys = {};

  GlobalKey _k(String id) => _keys.putIfAbsent(id, () => GlobalKey());

  void _scrollTo(String id) {
    final key = _keys[id];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(key!.currentContext!, duration: AppAnimations.normal, curve: AppAnimations.intenseCurve);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppDimensions.contentMaxWidth),
          child: Column(
            children: [
              // --- HERO (fixed) ---
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppPill(text: 'ATOMIC SYSTEM v2.0'),
                    const SizedBox(height: 16),
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

              // --- TAB BAR ---
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: isDark ? AppColors.gray800 : AppColors.gray200, width: 1)),
                ),
                child: TabBar(
                  controller: _tabController,
                  labelStyle: AppTypography.labelMedium.copyWith(fontWeight: FontWeight.w700),
                  unselectedLabelStyle: AppTypography.labelMedium,
                  labelColor: isDark ? Colors.white : AppColors.gray900,
                  unselectedLabelColor: AppColors.gray500,
                  indicatorColor: AppColors.pointOrange,
                  indicatorWeight: 2,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  dividerHeight: 0,
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  tabs: const [
                    Tab(text: 'Foundations'),
                    Tab(text: 'Atoms'),
                    Tab(text: 'Molecules'),
                    Tab(text: 'Organisms'),
                  ],
                ),
              ),

              // --- TAB CONTENT ---
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildFoundationsTab(context),
                    _buildAtomsTab(context),
                    _buildMoleculesTab(context),
                    _buildOrganismsTab(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // FOUNDATIONS TAB
  // ============================================================

  Widget _buildFoundationsTab(BuildContext context) {
    return _scrollView([
      _toc(context, _foundationsToc),
      _section(context, 'F.1', 'Theme Colors', '팔레트 및 포인트 그라데이션 정의', _buildThemeColors(context), key: _k('F.1')),
      _section(context, 'F.2', 'Typography Scale', '다국어 대응 텍스트 시스템 규격', _buildTypography(context), key: _k('F.2')),
      _section(context, 'F.3', 'Animation Tokens', '인터랙션 및 전환 효과 표준', _buildAnimations(context), key: _k('F.3')),
      _bottomPad(),
    ]);
  }

  // ============================================================
  // ATOMS TAB
  // ============================================================

  Widget _buildAtomsTab(BuildContext context) {
    return _scrollView([
      _toc(context, _atomsToc),
      _section(context, 'A.1', 'Action Buttons', '표준 버튼 변형 및 아이콘 버튼', _buildActionButtons(context), key: _k('A.1')),
      _section(context, 'A.2', 'Selection Controls', '체크박스 및 상태 전환', _buildSelectionControls(context), key: _k('A.2')),
      _section(context, 'A.3', 'Indicators & Containers', '아이콘 박스, 배지, 상태 표시기', _buildIndicators(context), key: _k('A.3')),
      _section(context, 'A.4', 'Identifiers', '아바타, 로고, 통계 수치', _buildIdentifiers(context), key: _k('A.4')),
      _section(context, 'A.5', 'Cards', '블로그, 팀원, 가격 카드', _buildCards(context), key: _k('A.5')),
      _section(context, 'A.6', 'Composites', '내비게이션, 메뉴, 피처 아이템', _buildComposites(context), key: _k('A.6')),
      _section(context, 'A.7', 'Text Inputs', '표준 입력, 접두어, 멀티라인', _buildTextInputs(context), key: _k('A.7')),
      _section(context, 'A.8', 'Form Controls', '레이블, 폼 필드, 선택 컨트롤', _buildFormControls(context), key: _k('A.8')),
      _section(context, 'A.9', 'Information Rows', '리스트, 설명, 파일 아이템', _buildInfoRows(context), key: _k('A.9')),
      _section(context, 'A.10', 'Pagination Units', '페이지 전환 최소 단위', _buildPagination(context), key: _k('A.10')),
      _section(context, 'A.11', 'Content Blocks', '벤토 박스 및 코드/디프 블록', _buildContentBlocks(context), key: _k('A.11')),
      _bottomPad(),
    ]);
  }

  // ============================================================
  // MOLECULES TAB
  // ============================================================

  Widget _buildMoleculesTab(BuildContext context) {
    return _scrollView([
      _toc(context, _moleculesToc),
      _section(context, 'M.1', 'Dropdowns', '정렬 옵션이 포함된 드롭다운 메뉴', _buildDropdowns(context), key: _k('M.1')),
      _section(context, 'M.2', 'Select Menus', '아바타 데이터 선택 메뉴', const AppSelectMenu(), key: _k('M.2')),
      _section(context, 'M.3', 'Pagination Bar', '반응형 페이지네이션 바', const AppFrame(title: 'pagination', child: AppPaginationBar()), key: _k('M.3')),
      _section(context, 'M.4', 'Drawers', '사이드 패널 및 드로어', const AppSlideOver(), key: _k('M.4')),
      _bottomPad(),
    ]);
  }

  // ============================================================
  // ORGANISMS TAB
  // ============================================================

  Widget _buildOrganismsTab(BuildContext context) {
    return _scrollView([
      _toc(context, _organismsToc),
      _section(context, 'O.1', 'Headers', '반응형 내비게이션 헤더', const AppFrame(title: 'nav_header', child: AppHeader()), key: _k('O.1')),
      _section(context, 'O.2', 'Hero', '마케팅 히어로 섹션', const AppFrame(title: 'hero', child: AppHero()), key: _k('O.2')),
      _section(context, 'O.3', 'Features', '아이콘 & 그리드 피처 섹션', const AppFeatures(), key: _k('O.3')),
      _section(context, 'O.4', 'Content Section', '2단 콘텐츠 레이아웃', const AppContentSection(), key: _k('O.4')),
      _section(context, 'O.5', 'Product Section', '제품 쇼케이스 레이아웃', const AppProductSection(), key: _k('O.5')),
      _section(context, 'O.6', 'Blog Section', '블로그 카드 그리드', const AppBlogSection(), key: _k('O.6')),
      _section(context, 'O.7', 'Team Section', '리더십 팀 그리드', const AppTeamSection(), key: _k('O.7')),
      _section(context, 'O.8', 'Statistics', '반응형 통계 그리드', const AppStatsSection(), key: _k('O.8')),
      _section(context, 'O.9', 'Stacked Lists', '고밀도 데이터 테이블', const AppStackedList(), key: _k('O.9')),
      _section(context, 'O.10', 'Description Lists', '구조화된 정보 목록', const AppDescriptionList(), key: _k('O.10')),
      _section(context, 'O.11', 'Bento Grid', '벤토 스타일 피처 그리드', const AppFrame(title: 'bento_grid', child: AppBentoGrid()), key: _k('O.11')),
      _section(context, 'O.12', 'Pricing', '가격 비교 섹션', const AppPricingSection(), key: _k('O.12')),
      _section(context, 'O.13', 'CTA', '액션 배너 섹션', const AppCtaSection(), key: _k('O.13')),
      _section(context, 'O.14', 'Newsletter', '뉴스레터 구독 섹션', const AppNewsletterSection(), key: _k('O.14')),
      _section(context, 'O.15', 'Contact', '문의 폼 섹션', const AppContactSection(), key: _k('O.15')),
      _section(context, 'O.16', 'Form Layouts', '설정 페이지 폼', const AppFrame(title: 'settings', child: AppFormLayout()), key: _k('O.16')),
      _section(context, 'O.17', 'Authentication', '로그인/회원가입 폼', const AppFrame(title: 'auth', child: AppAuth()), key: _k('O.17')),
      _bottomPad(),
    ]);
  }

  // ============================================================
  // CONTENT BUILDERS — ATOMS
  // ============================================================

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShowcaseUnit(unitId: 'A.1.primary', targetFiles: const [_pButton], label: 'Primary', child: AppButton(text: 'Primary Action', onPressed: () {})),
        AppShowcaseUnit(unitId: 'A.1.secondary', targetFiles: const [_pButton], label: 'Secondary', child: AppButton(text: 'Secondary', variant: AppButtonVariant.secondary, onPressed: () {})),
        AppShowcaseUnit(unitId: 'A.1.with_icon', targetFiles: const [_pButton], label: 'With Icon', child: AppButton(text: 'With Icon', icon: Icons.bolt, onPressed: () {})),
        AppShowcaseUnit(unitId: 'A.1.text_link', targetFiles: const [_pButton], label: 'Text Link', child: AppButton(text: 'Text Link', variant: AppButtonVariant.text, onPressed: () {})),
        AppShowcaseUnit(unitId: 'A.1.icon_button', targetFiles: const [_pIconButton], label: 'Icon Button', child: AppIconButton(icon: Icons.notifications_outlined, onPressed: () {})),
      ],
    );
  }

  Widget _buildSelectionControls(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShowcaseUnit(
          unitId: 'A.2.checkbox',
          targetFiles: const [_pCheckbox],
          label: 'Checkbox',
          child: AppCheckbox(initialValue: true, onChanged: (v) {}, title: 'Interactive Switch', description: 'Neutral gray toggle state.'),
        ),
        AppShowcaseUnit(
          unitId: 'A.2.toggle_on',
          targetFiles: const [_pToggle],
          label: 'Toggle (On)',
          child: AppToggle(value: true, onChanged: (v) {}),
        ),
        AppShowcaseUnit(
          unitId: 'A.2.toggle_off',
          targetFiles: const [_pToggle],
          label: 'Toggle (Off)',
          child: AppToggle(value: false, onChanged: (v) {}),
        ),
      ],
    );
  }

  Widget _buildIndicators(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShowcaseUnit(unitId: 'A.3.icon_box', targetFiles: [_pIconBox], label: 'Icon Box', child: AppIconBox(icon: Icons.bolt)),
        AppShowcaseUnit(unitId: 'A.3.icon_box_custom', targetFiles: [_pIconBox], label: 'Icon Box (Custom)', child: AppIconBox(icon: Icons.shield, color: AppColors.gray800, iconColor: Colors.white)),
        AppShowcaseUnit(unitId: 'A.3.notification_badge', targetFiles: [_pBadge], label: 'Notification Badge', child: AppBadge(variant: AppBadgeVariant.notification, size: 12)),
        AppShowcaseUnit(unitId: 'A.3.dot_badge', targetFiles: [_pBadge], label: 'Dot Badge', child: AppBadge(variant: AppBadgeVariant.dot, size: 10)),
        AppShowcaseUnit(unitId: 'A.3.pill', targetFiles: [_pPill], label: 'Pill', child: AppPill(text: 'NEW')),
        AppShowcaseUnit(unitId: 'A.3.status_online', targetFiles: [_pStatusIndicator], label: 'Status — Online', child: AppStatusIndicator(isOnline: true)),
        AppShowcaseUnit(unitId: 'A.3.status_offline', targetFiles: [_pStatusIndicator], label: 'Status — Offline', child: AppStatusIndicator(isOnline: false, lastSeen: '3h ago')),
        AppShowcaseUnit(unitId: 'A.3.announcement_badge', targetFiles: [_pAnnouncementBadge], label: 'Announcement Badge', child: AppAnnouncementBadge(text: 'We just launched v2.0', actionText: 'See details →')),
        AppShowcaseUnit(
          unitId: 'A.3.tool_box',
          targetFiles: [_pToolBox],
          label: 'Tool Box',
          child: AppToolBox(
            children: [
              AppToggle(value: true),
              AppIconButton(icon: Icons.auto_fix_high, size: 14),
            ],
          ),
        ),
        AppShowcaseUnit(
          unitId: 'A.3.dotted_line',
          targetFiles: [_pDottedLine],
          label: 'Dotted Line',
          child: SizedBox(width: 240, child: AppDottedLine()),
        ),
      ],
    );
  }

  Widget _buildIdentifiers(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShowcaseUnit(unitId: 'A.4.avatar', targetFiles: [_pAvatar], label: 'Avatar', child: AppAvatar(size: 56, isOnline: true)),
        AppShowcaseUnit(
          unitId: 'A.4.avatar_group',
          targetFiles: [_pAvatarGroup],
          label: 'Avatar Group',
          child: AppAvatarGroup(imageUrls: [], size: 32),
        ),
        AppShowcaseUnit(unitId: 'A.4.logo', targetFiles: [_pLogo], label: 'Logo', child: AppLogo(size: 40)),
        AppShowcaseUnit(unitId: 'A.4.logo_icon_only', targetFiles: [_pLogo], label: 'Logo (Icon only)', child: AppLogo(size: 40, showText: false)),
        AppShowcaseUnit(unitId: 'A.4.stat_item', targetFiles: [_pStatItem], label: 'Stat Item', child: AppStatItem(label: 'Global Transactions', value: '44 Million')),
      ],
    );
  }

  Widget _buildCards(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppShowcaseUnit(
          unitId: 'A.5.blog_card',
          targetFiles: [_pBlogCard],
          label: 'Blog Card',
          child: AppBlogCard(date: 'Mar 16, 2026', category: 'Marketing', title: 'Boost your conversion rate', description: 'Illo sint voluptas. Error voluptates laudantium.', authorName: 'Michael Foster', authorRole: 'Co-Founder / CTO'),
        ),
        const AppShowcaseUnit(unitId: 'A.5.team_member_card', targetFiles: [_pTeamMemberCard], label: 'Team Member Card', child: AppTeamMemberCard(name: 'Leslie Alexander', role: 'Co-Founder / CEO')),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: AppShowcaseUnit(unitId: 'A.5.pricing_card', targetFiles: const [_pPricingCard], label: 'Pricing Card', child: AppPricingCard(tier: 'Hobby', price: '\$29', period: '/month', description: 'The essentials to provide your best work.', features: const ['5 products', 'Up to 1,000 subscribers', 'Basic analytics'], buttonText: 'Get started', onPressed: () {})),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: AppShowcaseUnit(unitId: 'A.5.pricing_card_emphasized', targetFiles: const [_pPricingCard], label: 'Pricing Card (Emphasized)', child: AppPricingCard(tier: 'Enterprise', price: '\$99', period: '/month', description: 'Dedicated support and infrastructure.', features: const ['Unlimited products', 'Unlimited subscribers', 'Advanced analytics'], buttonText: 'Contact sales', isEmphasized: true, onPressed: () {})),
        ),
      ],
    );
  }

  Widget _buildComposites(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShowcaseUnit(unitId: 'A.6.feature_standard', targetFiles: [_pFeatureItem], label: 'Feature — Standard', child: AppFeatureItem(icon: Icons.cloud_upload_outlined, title: 'Push to deploy', description: 'Lorem ipsum dolor sit amet consectetur.')),
        AppShowcaseUnit(unitId: 'A.6.feature_inline', targetFiles: [_pFeatureItem], label: 'Feature — Inline', child: AppFeatureItem(icon: Icons.lock_outline, title: 'SSL certificates.', description: 'Anim aute id magna aliqua ad ad non deserunt.', variant: AppFeatureItemVariant.inline)),
        AppShowcaseUnit(unitId: 'A.6.feature_vertical', targetFiles: [_pFeatureItem], label: 'Feature — Vertical', child: AppFeatureItem(icon: Icons.bolt, title: 'Fast performance', description: 'Lightning fast build times.', variant: AppFeatureItemVariant.vertical)),
        AppShowcaseUnit(unitId: 'A.6.image_placeholder', targetFiles: [_pImagePlaceholder], label: 'Image Placeholder', child: AppImagePlaceholder(icon: Icons.photo_outlined)),
        AppShowcaseUnit(unitId: 'A.6.image_placeholder_shadow', targetFiles: [_pImagePlaceholder], label: 'Image Placeholder (Shadow)', child: AppImagePlaceholder(icon: Icons.dashboard_outlined, hasShadow: true)),
        AppShowcaseUnit(unitId: 'A.6.inactive_placeholder', targetFiles: [_pInactivePlaceholder], label: 'Inactive Placeholder', child: AppInactivePlaceholder()),
      ],
    );
  }

  Widget _buildTextInputs(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShowcaseUnit(unitId: 'A.7.standard', targetFiles: [_pTextField], label: 'Standard', child: AppTextField(hint: 'Standard Input Field')),
        AppShowcaseUnit(unitId: 'A.7.with_prefix', targetFiles: [_pTextField], label: 'With Prefix', child: AppTextField(prefix: 'workcation.com/', hint: 'janesmith')),
        AppShowcaseUnit(unitId: 'A.7.textarea', targetFiles: [_pTextField], label: 'TextArea', child: AppTextField(hint: 'TextArea', maxLines: 3)),
      ],
    );
  }

  Widget _buildFormControls(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppShowcaseUnit(unitId: 'A.8.field_label', targetFiles: [_pFieldLabel], label: 'Field Label', child: AppFieldLabel(label: 'Email Address')),
        const AppShowcaseUnit(unitId: 'A.8.form_field', targetFiles: [_pFormField], label: 'Form Field', child: AppFormField(label: 'Full Name', hint: 'John Doe')),
        const AppShowcaseUnit(unitId: 'A.8.form_field_password', targetFiles: [_pFormField], label: 'Form Field (Password)', child: AppFormField(label: 'Password', hint: '********', isPassword: true)),
        AppShowcaseUnit(unitId: 'A.8.select_trigger', targetFiles: const [_pSelectTrigger], label: 'Select Trigger', child: AppSelectTrigger(text: 'Tom Cook', isOpen: false, onTap: () {})),
        AppShowcaseUnit(unitId: 'A.8.dropdown_trigger', targetFiles: const [_pSelectTrigger], label: 'Dropdown Trigger', child: AppSelectTrigger(text: 'Options', isOpen: false, onTap: () {}, variant: AppSelectTriggerVariant.dropdown, expand: false)),
        const AppShowcaseUnit(unitId: 'A.8.select_option_selected', targetFiles: [_pSelectOption], label: 'Select Option (Selected)', child: AppSelectOption(name: 'Tom Cook', isSelected: true)),
        const AppShowcaseUnit(unitId: 'A.8.select_option', targetFiles: [_pSelectOption], label: 'Select Option', child: AppSelectOption(name: 'Leslie Alexander')),
      ],
    );
  }

  Widget _buildInfoRows(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppShowcaseUnit(unitId: 'A.9.list_item', targetFiles: const [_pListItem], label: 'List Item', child: AppSurface(child: AppListItem(onTap: () {}, leading: const AppAvatar(size: 40), title: 'Dries Vincent', subtitle: 'dries.vincent@example.com', trailing: const Icon(Icons.chevron_right, color: AppColors.gray400, size: 20)))),
        const AppShowcaseUnit(unitId: 'A.9.description_item', targetFiles: [_pDescriptionItem], label: 'Description Item', child: AppSurface(padding: EdgeInsets.symmetric(horizontal: 16), child: AppDescriptionItem(label: 'Role', content: Text('Director of Product', style: TextStyle(color: AppColors.gray500, fontSize: 14))))),
        AppShowcaseUnit(unitId: 'A.9.file_item', targetFiles: const [_pFileItem], label: 'File Item', child: AppSurface(child: AppFileItem(fileName: 'resume_v2.pdf', fileSize: '4.2mb', onDownload: () {}))),
      ],
    );
  }

  Widget _buildPagination(BuildContext context) {
    return Row(
      children: [
        AppPaginationItem(text: '1', isActive: true, isFirst: true, onTap: () {}),
        AppPaginationItem(text: '2', onTap: () {}),
        AppPaginationItem(icon: const Icon(Icons.chevron_right, size: 18), isLast: true, onTap: () {}),
      ],
    );
  }

  Widget _buildContentBlocks(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShowcaseUnit(
          unitId: 'A.11.bento_box',
          targetFiles: [_pBentoBox],
          label: 'Bento Box',
          child: AppBentoBox(title: 'Analytics', description: 'Track your metrics in real-time.', height: 260, icon: Icons.analytics),
        ),
        AppShowcaseUnit(
          unitId: 'A.11.code_block',
          targetFiles: [_pCodeBlock],
          label: 'Code Block',
          child: AppCodeBlock(
            language: 'dart',
            text: "final color = AppColors.pointOrange;\nprint('\$color');",
          ),
        ),
        AppShowcaseUnit(
          unitId: 'A.11.diff_view',
          targetFiles: [_pDiffView],
          label: 'Diff View',
          child: AppDiffView(
            diff: '--- a/lib/widgets/atoms/app_button.dart\n+++ b/lib/widgets/atoms/app_button.dart\n@@\n-      backgroundColor = AppColors.pointOrange;\n+      backgroundColor = AppColors.pointGold;',
          ),
        ),
      ],
    );
  }

  // ============================================================
  // CONTENT BUILDERS — MOLECULES
  // ============================================================

  Widget _buildDropdowns(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShowcaseUnit(unitId: 'M.1.left_align', targetFiles: [_pDropdown], label: 'Left Align', child: AppDropdown(alignment: DropdownAlignment.left, title: 'Left')),
        AppShowcaseUnit(unitId: 'M.1.center_align', targetFiles: [_pDropdown], label: 'Center Align', child: AppDropdown(alignment: DropdownAlignment.center, title: 'Center')),
        AppShowcaseUnit(unitId: 'M.1.right_align', targetFiles: [_pDropdown], label: 'Right Align', child: AppDropdown(alignment: DropdownAlignment.right, title: 'Right')),
      ],
    );
  }

  // ============================================================
  // CONTENT BUILDERS — FOUNDATIONS
  // ============================================================

  Widget _buildThemeColors(BuildContext context) {
    final grayscale = [
      ('gray_950', 'Gray 950', '#0A0A0A', AppColors.gray950), ('gray_900', 'Gray 900', '#171717', AppColors.gray900),
      ('gray_800', 'Gray 800', '#262626', AppColors.gray800), ('gray_700', 'Gray 700', '#404040', AppColors.gray700),
      ('gray_600', 'Gray 600', '#525252', AppColors.gray600), ('gray_500', 'Gray 500', '#737373', AppColors.gray500),
      ('gray_400', 'Gray 400', '#A3A3A3', AppColors.gray400), ('gray_300', 'Gray 300', '#D4D4D4', AppColors.gray300),
      ('gray_200', 'Gray 200', '#E5E5E5', AppColors.gray200), ('gray_100', 'Gray 100', '#F5F5F5', AppColors.gray100),
      ('gray_50', 'Gray 50', '#FAFAFA', AppColors.gray50),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShowcaseUnit(unitId: 'F.1.orange', targetFiles: const [_pColors], label: 'Orange', value: '#F94001', child: Container(width: 40, height: 40, decoration: const BoxDecoration(color: AppColors.pointOrange, borderRadius: BorderRadius.all(Radius.circular(8))))),
        AppShowcaseUnit(unitId: 'F.1.gold', targetFiles: const [_pColors], label: 'Gold', value: '#ED9D0B', child: Container(width: 40, height: 40, decoration: const BoxDecoration(color: AppColors.pointGold, borderRadius: BorderRadius.all(Radius.circular(8))))),
        const SizedBox(height: 32),
        ...grayscale.map((c) => AppShowcaseUnit(unitId: 'F.1.${c.$1}', targetFiles: const [_pColors], label: c.$2, value: c.$3, bottomPadding: 16, child: Container(width: 40, height: 40, decoration: BoxDecoration(color: c.$4, borderRadius: BorderRadius.circular(8), border: Border.all(color: Theme.of(context).colorScheme.outline, width: 1))))),
      ],
    );
  }

  Widget _buildTypography(BuildContext context) {
    Widget row(String cat, String catId, List<(String, String, TextStyle)> items) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((i) => AppShowcaseUnit(
        unitId: 'F.2.${catId}_${i.$1.toLowerCase()}',
        targetFiles: const [_pTypography],
        label: '$cat ${i.$2}',
        value: '${i.$3.fontSize?.toInt()}px',
        child: Text('디자인은 어떻게 작동하는지입니다.', style: i.$3),
      )).toList(),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        row('Display', 'display', [('large', 'Large', AppTypography.displayLarge), ('medium', 'Medium', AppTypography.displayMedium)]),
        const SizedBox(height: 32),
        row('Headline', 'headline', [('large', 'Large', AppTypography.headlineLarge), ('medium', 'Medium', AppTypography.headlineMedium)]),
        const SizedBox(height: 32),
        row('Title', 'title', [('large', 'Large', AppTypography.titleLarge), ('medium', 'Medium', AppTypography.titleMedium)]),
        const SizedBox(height: 32),
        row('Body', 'body', [('large', 'Large', AppTypography.bodyLarge), ('medium', 'Medium', AppTypography.bodyMedium)]),
      ],
    );
  }

  Widget _buildAnimations(BuildContext context) {
    final secondary = Theme.of(context).colorScheme.secondary;
    final labelStyle = AppTypography.labelSmall.copyWith(color: secondary, fontSize: 10, fontWeight: FontWeight.bold);
    final valueStyle = AppTypography.headlineSmall.copyWith(color: AppColors.pointOrange);

    Widget token(String value, String label) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: valueStyle),
        const SizedBox(height: 4),
        Text(label, style: labelStyle),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppShowcaseUnit(unitId: 'F.3.durations', targetFiles: [_pAnimations], label: 'Durations', child: SizedBox.shrink()),
        Row(children: [
          token('${AppAnimations.fast.inMilliseconds}ms', 'fast'),
          const SizedBox(width: 40),
          token('${AppAnimations.normal.inMilliseconds}ms', 'normal'),
          const SizedBox(width: 40),
          token('${AppAnimations.slow.inMilliseconds}ms', 'slow'),
        ]),
        const SizedBox(height: 32),
        const AppShowcaseUnit(unitId: 'F.3.curves', targetFiles: [_pAnimations], label: 'Curves', child: SizedBox.shrink()),
        Row(children: [
          token('easeOut', 'defaultCurve'),
          const SizedBox(width: 40),
          token('easeInOut', 'intenseCurve'),
        ]),
        const SizedBox(height: 32),
        const AppShowcaseUnit(unitId: 'F.3.slide', targetFiles: [_pAnimations], label: 'Slide', child: SizedBox.shrink()),
        token('Offset(1, 0)', 'slideInFromRight'),
        const SizedBox(height: 32),
        const AppShowcaseUnit(unitId: 'F.3.scale_tweens', targetFiles: [_pAnimations], label: 'Scale Tweens', child: SizedBox.shrink()),
        Row(children: [
          token('${AppAnimations.dropdownScaleBegin}', 'dropdownScale'),
          const SizedBox(width: 40),
          token('${AppAnimations.selectScaleBegin}', 'selectScale'),
          const SizedBox(width: 40),
          token('${AppAnimations.checkboxScaleBegin}', 'checkboxScale'),
        ]),
        const SizedBox(height: 32),
        AppShowcaseUnit(unitId: 'F.3.interaction', targetFiles: const [_pAnimations], label: 'Interaction', child: AppButton(text: 'Click to test ripple', variant: AppButtonVariant.secondary, onPressed: () {})),
      ],
    );
  }

  // ============================================================
  // SHARED HELPERS
  // ============================================================

  Widget _scrollView(List<Widget> slivers) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: CustomScrollView(slivers: slivers),
    );
  }

  Widget _toc(BuildContext context, List<(String, String)> entries) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
        child: AppSurface(
          color: isDark ? AppColors.gray900 : AppColors.gray50,
          padding: const EdgeInsets.all(24),
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('TABLE OF CONTENTS', style: AppTypography.labelSmall.copyWith(color: AppColors.pointOrange, fontWeight: FontWeight.bold, letterSpacing: 2)),
              const SizedBox(height: 16),
              ...entries.map((e) {
                final isNew = _newItems.contains(e.$1);
                return InkWell(
                  onTap: () => _scrollTo(e.$1),
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Text(e.$1, style: AppTypography.labelSmall.copyWith(color: AppColors.pointOrange, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 8),
                        Text(e.$2, style: AppTypography.labelSmall.copyWith(color: isDark ? AppColors.gray300 : AppColors.gray700)),
                        if (isNew) ...[const SizedBox(width: 8), const AppPill(text: 'NEW')],
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _section(BuildContext context, String index, String name, String desc, Widget child, {Key? key}) {
    return SliverToBoxAdapter(
      key: key,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(index, style: AppTypography.labelSmall.copyWith(color: AppColors.pointOrange, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              Text(name, style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w800)),
            ]),
            const SizedBox(height: 8),
            Text(desc, style: AppTypography.bodySmall.copyWith(color: Theme.of(context).colorScheme.secondary)),
            const SizedBox(height: 32),
            child,
          ],
        ),
      ),
    );
  }

  SliverPadding _bottomPad() => const SliverPadding(padding: EdgeInsets.only(bottom: 120));
}
