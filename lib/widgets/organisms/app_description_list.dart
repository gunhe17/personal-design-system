import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_typography.dart';
import '../atoms/app_description_item.dart';
import '../atoms/app_file_item.dart';
import '../atoms/app_surface.dart';
import '../atoms/app_section_header.dart';

class AppDescriptionList extends StatelessWidget {
  const AppDescriptionList({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final dividerColor = isDark ? Colors.white.withValues(alpha: 0.05) : AppColors.gray200;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSectionHeader(
            title: 'Applicant Information',
            description: 'Personal details and application.',
            variant: AppSectionHeaderVariant.section,
          ),
          const SizedBox(height: 24),

          AppDescriptionItem(
            label: 'Full name',
            content: _buildTextContent('Margot Foster', isDark),
          ),
          Divider(color: dividerColor, height: 1),
          AppDescriptionItem(
            label: 'Application for',
            content: _buildTextContent('Backend Developer', isDark),
          ),
          Divider(color: dividerColor, height: 1),
          AppDescriptionItem(
            label: 'Email address',
            content: _buildTextContent('margotfoster@example.com', isDark),
          ),
          Divider(color: dividerColor, height: 1),
          AppDescriptionItem(
            label: 'Salary expectation',
            content: _buildTextContent('\$120,000', isDark),
          ),
          Divider(color: dividerColor, height: 1),
          AppDescriptionItem(
            label: 'About',
            content: _buildTextContent(
              'Fugiat ipsum ipsum deserunt culpa aute sint do nostrud anim incididunt cillum culpa consequat.',
              isDark,
            ),
          ),
          Divider(color: dividerColor, height: 1),
          AppDescriptionItem(
            label: 'Attachments',
            content: _buildAttachments(isDark),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(String text, bool isDark) {
    return Text(
      text,
      style: AppTypography.bodySmall.copyWith(
        color: isDark ? AppColors.gray400 : AppColors.gray600,
        height: 1.4,
      ),
    );
  }

  Widget _buildAttachments(bool isDark) {
    final borderColor = isDark ? AppColors.gray800 : AppColors.gray200;
    
    return AppSurface(
      child: Column(
        children: [
          AppFileItem(fileName: 'resume_back_end_developer.pdf', fileSize: '2.4mb', onDownload: () {}),
          Divider(color: borderColor, height: 1),
          AppFileItem(fileName: 'coverletter_back_end_developer.pdf', fileSize: '4.5mb', onDownload: () {}),
        ],
      ),
    );
  }
}
