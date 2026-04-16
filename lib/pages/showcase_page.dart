import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_typography.dart';
import '../core/app_dimensions.dart';

class ShowcasePage extends StatelessWidget {
  const ShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
                
                _buildCategoryHeader(context, '00. Configuration', '시각적 핵심을 정의하는 전역 변수 설정입니다.'),
                _buildFoundationSection(context, '0.1', 'Theme Colors', _buildThemeColorConfig(context)),
                _buildFoundationSection(context, '0.2', 'Corner Radius', _buildRadiusConfig(context)),
                _buildFoundationSection(context, '0.3', 'Global Font', _buildFontConfig(context)),
                _buildFoundationSection(context, '0.4', 'Standard Sizes', _buildSizeConfig(context)),

                _buildCategoryHeader(context, '01. Foundations', '디자인 시스템의 기초가 되는 시각적 DNA 토큰입니다.'),
                _buildFoundationSection(context, '1.1', 'Color Palette', _buildColorPalette(context)),
                _buildFoundationSection(context, '1.2', 'Typography Scale', _buildTypographyScale(context)),
                _buildFoundationSection(context, '1.3', 'Elevation & Shadows', _buildElevationScale(context)),
                _buildFoundationSection(context, '1.4', 'Iconography', _buildIconSet(context)),

                _buildCategoryHeader(context, '02. Actions', '사용자의 행동을 유도하는 트리거 컴포넌트입니다.'),
                _buildComponentSection(
                  context,
                  index: '2.1',
                  name: 'Common Button',
                  description: '다양한 크기와 강조 수준을 가진 주요 액션 버튼입니다.',
                  rows: [
                    _buildSpecRow(context, '크기 (36 / 44 / 52)', [
                      _buildButton(size: AppDimensions.heightSmall, label: '소형'),
                      _buildButton(size: AppDimensions.heightMedium, label: '중형'),
                      _buildButton(size: AppDimensions.heightLarge, label: '대형'),
                    ]),
                    _buildSpecRow(context, '스타일 (Filled / ElevatedButton / Outlined / Tonal)', [
                      FilledButton(onPressed: () {}, child: const Text('채움')),
                      ElevatedButton(onPressed: () {}, child: const Text('입체')),
                      OutlinedButton(onPressed: () {}, child: const Text('테두리')),
                      FilledButton.tonal(onPressed: () {}, child: const Text('토널')),
                    ]),
                  ],
                ),
                _buildComponentSection(
                  context,
                  index: '2.2',
                  name: 'Text & Icon',
                  description: '보조 액션이나 좁은 공간을 위한 컴팩트 트리거입니다.',
                  rows: [
                    _buildSpecRow(context, '텍스트 버튼', [
                      TextButton(onPressed: () {}, child: const Text('기본형')),
                      TextButton(onPressed: () {}, child: const Text('밑줄형', style: TextStyle(decoration: TextDecoration.underline))),
                    ]),
                    _buildSpecRow(context, '아이콘 버튼', [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                      IconButton.filled(onPressed: () {}, icon: const Icon(Icons.add)),
                      IconButton.outlined(onPressed: () {}, icon: const Icon(Icons.add)),
                    ]),
                  ],
                ),
                _buildComponentSection(
                  context,
                  index: '2.3',
                  name: 'FAB & Segmented Control',
                  description: '플로팅 액션 및 뷰 전환을 위한 세그먼트 컨트롤입니다.',
                  rows: [
                    _buildSpecRow(context, 'FAB (Small / Medium / Large)', [
                      _buildFab(size: AppDimensions.sizeSmall, icon: Icons.add),
                      _buildFab(size: AppDimensions.sizeMedium, icon: Icons.add),
                      _buildFab(size: AppDimensions.sizeLarge, icon: Icons.add),
                    ]),
                    _buildSpecRow(context, '세그먼트 컨트롤 (Segmented Control)', [
                      _buildSegmentedControl(context),
                    ]),
                  ],
                ),

                _buildCategoryHeader(context, '03. Inputs', '데이터 입력 및 선택을 위한 컨트롤입니다.'),
                _buildComponentSection(
                  context,
                  index: '3.1',
                  name: 'Text Input',
                  description: '한 줄 또는 여러 줄의 텍스트 입력창입니다.',
                  rows: [
                    _buildSpecRow(context, '입력창 (Outlined / Filled)', [
                      _buildTextField(width: 240, label: '테두리형', filled: false),
                      _buildTextField(width: 240, label: '채움형', filled: true),
                    ]),
                    _buildSpecRow(context, '텍스트 영역 & 리치 에디터', [
                      _buildTextArea(width: 240, label: '여러 줄 입력', maxLines: 3),
                      _buildRichTextEditor(context),
                    ]),
                  ],
                ),
                _buildComponentSection(
                  context,
                  index: '3.2',
                  name: 'Numeric, Range & Rating',
                  description: '수치 데이터 및 평가 입력을 위한 컨트롤입니다.',
                  rows: [
                    _buildSpecRow(context, '숫자 필드 & 별점 (Rating)', [
                      _buildTextField(width: 160, label: '나이', keyboardType: TextInputType.number),
                      _buildRatingStars(context),
                    ]),
                    _buildSpecRow(context, '슬라이더 (Continuous / Discrete)', [
                      SizedBox(width: 200, child: Slider(value: 0.4, onChanged: (v) {})),
                      SizedBox(width: 200, child: Slider(value: 3, min: 0, max: 5, divisions: 5, onChanged: (v) {})),
                    ]),
                  ],
                ),
                _buildComponentSection(
                  context,
                  index: '3.3',
                  name: 'Selection (Boolean & List)',
                  description: '토글, 선택 목록 및 태그입니다.',
                  rows: [
                    _buildSpecRow(context, '스위치 & 체크박스', [
                      Switch(value: true, onChanged: (v) {}),
                      Checkbox(value: true, onChanged: (v) {}),
                      _buildDropdown(width: 180, label: '옵션'),
                    ]),
                    _buildSpecRow(context, '초이스 칩', [
                      ChoiceChip(label: const Text('옵션 1'), selected: true, onSelected: (v) {}),
                      ChoiceChip(label: const Text('옵션 2'), selected: false, onSelected: (v) {}),
                    ]),
                  ],
                ),
                _buildComponentSection(
                  context,
                  index: '3.4',
                  name: 'File & Specialized',
                  description: '파일 업로드 및 특수 입력 도구입니다.',
                  rows: [
                    _buildSpecRow(context, '파일 업로더 (File Uploader)', [
                      _buildFileUploader(context),
                    ]),
                    _buildSpecRow(context, '날짜 & 색상 선택기', [
                      OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.calendar_today, size: 18), label: const Text('날짜 선택')),
                      _buildColorSwatchPicker(),
                    ]),
                  ],
                ),

                _buildCategoryHeader(context, '04. Media Utility', '미디어 처리 및 갤러리 도구입니다.'),
                _buildComponentSection(
                  context,
                  index: '4.1',
                  name: 'Image Tools',
                  description: '이미지 편집 및 보기 도구입니다.',
                  rows: [
                    _buildSpecRow(context, '이미지 크롭퍼 (Cropper)', [
                      _buildImageCropperPlaceholder(context),
                    ]),
                    _buildSpecRow(context, '이미지 갤러리 (Gallery Grid)', [
                      _buildImageGalleryPlaceholder(context),
                    ]),
                  ],
                ),

                _buildCategoryHeader(context, '05. Communication', '상태 알림 및 진행률 표시기입니다.'),
                _buildComponentSection(
                  context,
                  index: '5.1',
                  name: 'Loading & Progress',
                  description: '진행률 및 로딩 상태를 시각화합니다.',
                  rows: [
                    _buildSpecRow(context, '원형 / 선형', [
                      const SizedBox(width: 32, height: 32, child: CircularProgressIndicator(strokeWidth: 2)),
                      const SizedBox(width: 160, child: LinearProgressIndicator()),
                    ]),
                    _buildSpecRow(context, '스켈레톤 (Skeleton)', [
                      _buildSkeletonPlaceholder(context),
                    ]),
                  ],
                ),
                _buildComponentSection(
                  context,
                  index: '5.2',
                  name: 'Overlays & Feedback',
                  description: '앱 내 알림 메시지와 부가 정보 툴팁입니다.',
                  rows: [
                    _buildSpecRow(context, '알림 배너', [
                      _buildAlert(context, '성공적으로 저장되었습니다.', Colors.green.shade50, Colors.green),
                    ]),
                    _buildSpecRow(context, '스낵바, 툴팁 & 모달 트리거', [
                      _buildOverlayTriggers(context),
                    ]),
                  ],
                ),

                _buildCategoryHeader(context, '06. Navigation', '앱 구조와 화면 이동을 위한 도구입니다.'),
                _buildComponentSection(
                  context,
                  index: '6.1',
                  name: 'Standard Navigation',
                  description: '바, 탭, 빵부스러기, 페이지네이션입니다.',
                  rows: [
                    _buildSpecRow(context, '내비게이션 바 & 탭', [
                      _buildNavBarExample(),
                    ]),
                    _buildSpecRow(context, '브레드크럼 (Breadcrumbs) & 페이지네이션', [
                      _buildBreadcrumbs(context),
                      _buildPagination(context),
                    ]),
                  ],
                ),
                _buildComponentSection(
                  context,
                  index: '6.2',
                  name: 'Stepper & Drawer',
                  description: '진행 상태 및 드로어 메뉴입니다.',
                  rows: [
                    _buildSpecRow(context, '스테퍼 (Stepper)', [
                      _buildStepperExample(context),
                    ]),
                    _buildSpecRow(context, '내비게이션 드로어 트리거', [
                      OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.menu), label: const Text('드로어 열기')),
                    ]),
                  ],
                ),

                _buildCategoryHeader(context, '07. Containment & Data', '정보 그룹화 및 데이터 표시입니다.'),
                _buildComponentSection(
                  context,
                  index: '7.1',
                  name: 'Containers',
                  description: '콘텐츠를 담는 카드와 아코디언입니다.',
                  rows: [
                    _buildSpecRow(context, '카드 (S/M/L)', [
                      const Card(elevation: 1, child: SizedBox(width: 100, height: 60, child: Center(child: Text('입체형 카드')))),
                      Card(color: colorScheme.surface, elevation: 0, child: const SizedBox(width: 100, height: 60, child: Center(child: Text('채움형 카드')))),
                    ]),
                    _buildSpecRow(context, '아코디언 (Accordion / Expander)', [
                      _buildAccordionExample(context),
                    ]),
                  ],
                ),
                _buildComponentSection(
                  context,
                  index: '7.2',
                  name: 'Data Display & Status',
                  description: '구조화된 데이터와 엠티 스테이트, 뱃지입니다.',
                  rows: [
                    _buildSpecRow(context, '아바타 & 뱃지 (Badge / Tag)', [
                      _buildAvatar(context, radius: AppDimensions.sizeMedium/2, text: 'M'),
                      _buildBadgeExample(context),
                    ]),
                    _buildSpecRow(context, '트리 뷰 (Tree View)', [
                      _buildTreeViewExample(context),
                    ]),
                    _buildSpecRow(context, '빈 상태 (Empty State)', [
                      _buildEmptyStateExample(context),
                    ]),
                    _buildSpecRow(context, '데이터 테이블', [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: _buildDataTableExample(),
                      ),
                    ]),
                  ],
                ),

                _buildCategoryHeader(context, '08. Layout', '레이아웃 그리드 및 간격 가이드입니다.'),
                _buildComponentSection(
                  context,
                  index: '8.1',
                  name: 'Grid & Structure',
                  description: '앱의 기본 골격과 여백 규칙입니다.',
                  rows: [
                    _buildSpecRow(context, '그리드 가이드 (8px Grid)', [
                      _buildGridGuide(context),
                    ]),
                  ],
                ),
                
                const SliverPadding(padding: EdgeInsets.only(bottom: 120)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Widget Builders for Consistency ---

  Widget _buildThemeColorConfig(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 40,
      children: [
        _buildConfigItem(context, '기본 무채색', Container(width: 40, height: 40, decoration: BoxDecoration(color: colorScheme.primary, shape: BoxShape.circle))),
        _buildConfigItem(context, '포인트 그라데이션', Container(
          width: 80, 
          height: 40, 
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: AppColors.pointGradient),
            borderRadius: BorderRadius.circular(20)
          )
        )),
      ],
    );
  }

  Widget _buildRadiusConfig(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 40,
      children: [
        _buildConfigItem(context, 'S: ${AppDimensions.radiusSmall}px', Container(width: 40, height: 40, decoration: BoxDecoration(color: colorScheme.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(AppDimensions.radiusSmall)))),
        _buildConfigItem(context, 'M (기준): ${AppDimensions.radiusMedium}px', Container(width: 40, height: 40, decoration: BoxDecoration(color: colorScheme.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(AppDimensions.radiusMedium)))),
        _buildConfigItem(context, 'L: ${AppDimensions.radiusLarge}px', Container(width: 40, height: 40, decoration: BoxDecoration(color: colorScheme.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(AppDimensions.radiusLarge)))),
      ],
    );
  }

  Widget _buildFontConfig(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('주 폰트: Pretendard', style: AppTypography.titleMedium),
        SizedBox(height: 8),
        Text('가나다라 ABC 123 !@#', style: AppTypography.displayLarge),
      ],
    );
  }

  Widget _buildSizeConfig(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 40,
      children: [
        _buildConfigItem(context, 'S (${AppDimensions.sizeSmall.toInt()}px)', Container(width: AppDimensions.sizeSmall, height: AppDimensions.sizeSmall, decoration: BoxDecoration(color: colorScheme.outline, borderRadius: BorderRadius.circular(4)))),
        _buildConfigItem(context, 'M (${AppDimensions.sizeMedium.toInt()}px)', Container(width: AppDimensions.sizeMedium, height: AppDimensions.sizeMedium, decoration: BoxDecoration(color: colorScheme.outline, borderRadius: BorderRadius.circular(4)))),
        _buildConfigItem(context, 'L (${AppDimensions.sizeLarge.toInt()}px)', Container(width: AppDimensions.sizeLarge, height: AppDimensions.sizeLarge, decoration: BoxDecoration(color: colorScheme.outline, borderRadius: BorderRadius.circular(4)))),
      ],
    );
  }

  Widget _buildIconSet(BuildContext context) {
    final icons = [Icons.home, Icons.search, Icons.settings, Icons.person, Icons.notifications, Icons.add];
    return Wrap(
      spacing: 24,
      children: icons.map((icon) => Icon(icon, size: 24, color: Theme.of(context).colorScheme.primary)).toList(),
    );
  }

  // --- NEW COMPONENTS (v1.2) ---

  Widget _buildSegmentedControl(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.outline.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: colorScheme.surface, borderRadius: BorderRadius.circular(AppDimensions.radiusSmall), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 2)]),
            child: Text('옵션 1', style: AppTypography.labelLarge.copyWith(color: colorScheme.primary)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('옵션 2', style: AppTypography.labelLarge.copyWith(color: colorScheme.secondary)),
          ),
        ],
      ),
    );
  }

  Widget _buildRichTextEditor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 280,
      decoration: BoxDecoration(border: Border.all(color: colorScheme.outline), borderRadius: BorderRadius.circular(AppDimensions.radiusMedium)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: colorScheme.outline))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.format_bold, size: 18, color: colorScheme.secondary),
                const SizedBox(width: 12),
                Icon(Icons.format_italic, size: 18, color: colorScheme.secondary),
                const SizedBox(width: 12),
                Icon(Icons.format_list_bulleted, size: 18, color: colorScheme.secondary),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text('리치 텍스트 에디터 본문입니다...', style: AppTypography.bodySmall),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingStars(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) => Icon(
        index < 4 ? Icons.star : Icons.star_border,
        color: AppColors.pointGradient[1],
        size: 24,
      )),
    );
  }

  Widget _buildFileUploader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 320,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.outline),
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        color: colorScheme.surface,
      ),
      child: Row(
        children: [
          Icon(Icons.cloud_upload_outlined, color: colorScheme.secondary),
          const SizedBox(width: 12),
          const Expanded(child: Text('파일을 드래그하거나 클릭하세요', style: AppTypography.bodySmall)),
        ],
      ),
    );
  }

  Widget _buildOverlayTriggers(BuildContext context) {
    return Wrap(
      spacing: 12,
      children: [
        OutlinedButton(onPressed: () {}, child: const Text('스낵바 띄우기')),
        OutlinedButton(onPressed: () {}, child: const Text('모달 열기')),
        Tooltip(
          message: '이것은 툴팁입니다.',
          child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.help_outline, size: 16), label: const Text('툴팁 보기')),
        ),
      ],
    );
  }

  Widget _buildBreadcrumbs(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('홈', style: AppTypography.bodySmall.copyWith(color: colorScheme.secondary)),
        Icon(Icons.chevron_right, size: 16, color: colorScheme.secondary),
        Text('카테고리', style: AppTypography.bodySmall.copyWith(color: colorScheme.secondary)),
        Icon(Icons.chevron_right, size: 16, color: colorScheme.secondary),
        const Text('현재 페이지', style: AppTypography.bodySmall),
      ],
    );
  }

  Widget _buildPagination(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.chevron_left, color: colorScheme.secondary),
        const SizedBox(width: 16),
        const Text('1', style: AppTypography.labelLarge),
        const SizedBox(width: 16),
        Text('2', style: AppTypography.bodySmall.copyWith(color: colorScheme.secondary)),
        const SizedBox(width: 16),
        Text('3', style: AppTypography.bodySmall.copyWith(color: colorScheme.secondary)),
        const SizedBox(width: 16),
        Icon(Icons.chevron_right, color: colorScheme.primary),
      ],
    );
  }

  Widget _buildAccordionExample(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 320,
      decoration: BoxDecoration(border: Border.all(color: colorScheme.outline), borderRadius: BorderRadius.circular(AppDimensions.radiusMedium)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('아코디언 항목 1', style: AppTypography.labelLarge),
                Icon(Icons.expand_more, color: colorScheme.secondary),
              ],
            ),
          ),
          Divider(color: colorScheme.outline, height: 1),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text('여기에 상세 내용이 펼쳐집니다.', style: AppTypography.bodySmall.copyWith(color: colorScheme.secondary)),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeExample(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Badge(
          backgroundColor: AppColors.pointGradient[0],
          label: const Text('3'),
          child: Icon(Icons.notifications, color: colorScheme.primary),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: colorScheme.outline, borderRadius: BorderRadius.circular(12)),
          child: const Text('태그 (Tag)', style: AppTypography.labelSmall),
        ),
      ],
    );
  }

  Widget _buildEmptyStateExample(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 320,
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(color: colorScheme.surface, border: Border.all(color: colorScheme.outline, style: BorderStyle.solid), borderRadius: BorderRadius.circular(AppDimensions.radiusMedium)),
      child: Column(
        children: [
          Icon(Icons.inbox_outlined, size: 48, color: colorScheme.outline),
          const SizedBox(height: 16),
          const Text('데이터가 없습니다', style: AppTypography.titleMedium),
          const SizedBox(height: 8),
          Text('새로운 항목을 추가해보세요.', style: AppTypography.bodySmall.copyWith(color: colorScheme.secondary)),
        ],
      ),
    );
  }

  Widget _buildTreeViewExample(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [Icon(Icons.folder, size: 16, color: colorScheme.secondary), const SizedBox(width: 8), const Text('프로젝트 폴더', style: AppTypography.bodySmall)]),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 8),
          child: Row(children: [Icon(Icons.insert_drive_file, size: 16, color: colorScheme.secondary), const SizedBox(width: 8), const Text('문서.txt', style: AppTypography.bodySmall)]),
        ),
      ],
    );
  }

  // --- Image Utilities ---

  Widget _buildImageCropperPlaceholder(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline),
        borderRadius: BorderRadius.circular(80),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.image_outlined, color: colorScheme.outline, size: 48),
          Container(decoration: BoxDecoration(border: Border.all(color: AppColors.pointGradient[0], width: 2), shape: BoxShape.circle)),
        ],
      ),
    );
  }

  Widget _buildImageGalleryPlaceholder(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(4, (i) => Container(
        width: 60, height: 60,
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(8)),
        child: const Icon(Icons.photo, size: 20, color: Colors.white24),
      )),
    );
  }

  Widget _buildSkeletonPlaceholder(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 200, height: 16, decoration: BoxDecoration(color: colorScheme.outline.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(4))),
        const SizedBox(height: 8),
        Container(width: 120, height: 12, decoration: BoxDecoration(color: colorScheme.outline.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4))),
      ],
    );
  }

  Widget _buildStepperExample(BuildContext context) {
    return Row(
      children: [
        _buildStep(context, '1', true),
        _buildStepDivider(context, true),
        _buildStep(context, '2', false),
        _buildStepDivider(context, false),
        _buildStep(context, '3', false),
      ],
    );
  }

  Widget _buildStep(BuildContext context, String label, bool active) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 28, height: 28,
      decoration: BoxDecoration(color: active ? colorScheme.primary : colorScheme.outline, shape: BoxShape.circle),
      child: Center(child: Text(label, style: TextStyle(color: active ? colorScheme.onPrimary : colorScheme.secondary, fontSize: 12, fontWeight: FontWeight.bold))),
    );
  }

  Widget _buildStepDivider(BuildContext context, bool active) {
    return Container(width: 40, height: 2, color: active ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outline);
  }

  Widget _buildGridGuide(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all(color: Theme.of(context).colorScheme.outline)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(12, (i) => Container(width: 12, color: AppColors.pointGradient[0].withValues(alpha: 0.1))),
      ),
    );
  }

  Widget _buildConfigItem(BuildContext context, String label, Widget widget) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        widget,
        const SizedBox(height: 12),
        Text(label, style: AppTypography.labelSmall.copyWith(color: colorScheme.secondary)),
      ],
    );
  }

  Widget _buildButton({required double size, required String label}) {
    return SizedBox(
      height: size,
      child: FilledButton(onPressed: () {}, child: Text(label)),
    );
  }

  Widget _buildFab({required double size, required IconData icon}) {
    return SizedBox(
      width: size,
      height: size,
      child: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        child: Icon(icon, size: size * 0.5),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, {required double radius, String? text}) {
    final colorScheme = Theme.of(context).colorScheme;
    return CircleAvatar(
      radius: radius,
      backgroundColor: colorScheme.primary,
      child: text != null ? Text(text, style: TextStyle(color: colorScheme.onPrimary, fontSize: radius * 0.8)) : null,
    );
  }

  Widget _buildTextField({required double width, required String label, bool filled = false, TextInputType? keyboardType}) {
    return SizedBox(
      width: width,
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(labelText: label, filled: filled, isDense: true),
      ),
    );
  }

  Widget _buildTextArea({required double width, required String label, int maxLines = 1}) {
    return SizedBox(
      width: width,
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder(), alignLabelWithHint: true),
      ),
    );
  }

  Widget _buildDropdown({required double width, required String label}) {
    return SizedBox(
      width: width,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(labelText: label, isDense: true),
        items: const [DropdownMenuItem(value: '1', child: Text('옵션 1'))],
        onChanged: (v) {},
      ),
    );
  }

  Widget _buildAlert(BuildContext context, String message, Color bgColor, Color borderColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: bgColor, border: Border.all(color: borderColor.withValues(alpha: 0.3)), borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.info_outline, size: 18, color: borderColor),
          const SizedBox(width: 12),
          Text(message, style: AppTypography.bodySmall.copyWith(color: borderColor)),
        ],
      ),
    );
  }

  Widget _buildNavBarExample() {
    return Container(
      width: 360,
      decoration: BoxDecoration(border: Border.all(color: Colors.black12), borderRadius: BorderRadius.circular(8)),
      child: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: '홈'),
          NavigationDestination(icon: Icon(Icons.search), label: '탐색'),
        ],
        selectedIndex: 0,
        height: 64,
      ),
    );
  }

  Widget _buildDataTableExample() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [DataColumn(label: Text('ID')), DataColumn(label: Text('상태'))],
          rows: const [DataRow(cells: [DataCell(Text('001')), DataCell(Text('완료'))])],
        ),
      ),
    );
  }

  Widget _buildColorSwatchPicker() {
    final colors = [Colors.red, Colors.blue, Colors.green];
    return Wrap(
      spacing: 8,
      children: colors.map((color) => Container(width: 24, height: 24, decoration: BoxDecoration(color: color, shape: BoxShape.circle))).toList(),
    );
  }

  // --- Layout Helper Widgets ---

  Widget _buildHeroSection(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 64, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('DESIGN SYSTEM v1.3', style: AppTypography.labelSmall),
            SizedBox(height: 8),
            Text('Visual Spec', style: AppTypography.displayLarge),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryHeader(BuildContext context, String title, String description) {
    final colorScheme = Theme.of(context).colorScheme;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title.toUpperCase(), style: AppTypography.headlineSmall),
            const SizedBox(height: 4),
            Text(description, style: AppTypography.bodySmall.copyWith(color: colorScheme.secondary)),
          ],
        ),
      ),
    );
  }

  Widget _buildFoundationSection(BuildContext context, String index, String name, Widget widget) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$index $name', style: AppTypography.titleMedium),
            const SizedBox(height: 16),
            widget,
          ],
        ),
      ),
    );
  }

  Widget _buildComponentSection(BuildContext context, {required String index, required String name, required String description, required List<Widget> rows}) {
    final colorScheme = Theme.of(context).colorScheme;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$index $name', style: AppTypography.headlineSmall),
            const SizedBox(height: 4),
            Text(description, style: AppTypography.bodySmall.copyWith(color: colorScheme.secondary)),
            const SizedBox(height: 32),
            ...rows,
          ],
        ),
      ),
    );
  }

  Widget _buildSpecRow(BuildContext context, String label, List<Widget> examples) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.labelSmall.copyWith(fontSize: 10, letterSpacing: 1.2, color: colorScheme.secondary.withValues(alpha: 0.6))),
          const SizedBox(height: 20),
          Wrap(spacing: 24, runSpacing: 24, crossAxisAlignment: WrapCrossAlignment.center, children: examples),
        ],
      ),
    );
  }

  Widget _buildColorPalette(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: AppColors.palette.map((color) => Container(width: 48, height: 48, decoration: BoxDecoration(color: color, shape: BoxShape.circle, border: Border.all(color: Theme.of(context).colorScheme.outline)))).toList(),
    );
  }

  Widget _buildTypographyScale(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTypographyRow('Display', [AppTypography.displayLarge, AppTypography.displayMedium, AppTypography.displaySmall]),
        const SizedBox(height: 24),
        _buildTypographyRow('Headline', [AppTypography.headlineLarge, AppTypography.headlineMedium, AppTypography.headlineSmall]),
        const SizedBox(height: 24),
        _buildTypographyRow('Title', [AppTypography.titleLarge, AppTypography.titleMedium, AppTypography.titleSmall]),
        const SizedBox(height: 24),
        _buildTypographyRow('Body', [AppTypography.bodyLarge, AppTypography.bodyMedium, AppTypography.bodySmall]),
        const SizedBox(height: 24),
        _buildTypographyRow('Label', [AppTypography.labelLarge, AppTypography.labelMedium, AppTypography.labelSmall]),
      ],
    );
  }

  Widget _buildTypographyRow(String category, List<TextStyle> styles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...styles.map((style) => Padding(padding: const EdgeInsets.only(bottom: 4.0), child: Text('$category ${style.fontSize?.toInt()}', style: style))),
      ],
    );
  }

  Widget _buildElevationScale(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Wrap(
      spacing: 32,
      runSpacing: 32,
      children: List.generate(6, (index) => Container(
        width: 64, height: 64,
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(8), boxShadow: AppColors.elevation(index, isDark)),
        child: Center(child: Text('L$index', style: AppTypography.labelSmall.copyWith(color: Theme.of(context).colorScheme.secondary))),
      )),
    );
  }
}
