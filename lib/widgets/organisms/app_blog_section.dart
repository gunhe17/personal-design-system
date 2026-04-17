import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../atoms/app_blog_card.dart';
import '../atoms/app_section_header.dart';

class AppBlogSection extends StatelessWidget {
  const AppBlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.gray950 : Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSectionHeader(
            title: 'From the blog',
            description: 'Learn how to grow your business with our expert advice.',
            variant: AppSectionHeaderVariant.section,
          ),
          const SizedBox(height: 64),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 1024;
              
              if (isWide) {
                return const IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppBlogCard(
                          date: 'Mar 16, 2020',
                          category: 'Marketing',
                          title: 'Boost your conversion rate',
                          description: 'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde.',
                          authorName: 'Michael Foster',
                          authorRole: 'Co-Founder / CTO',
                        ),
                      ),
                      SizedBox(width: 32),
                      Expanded(
                        child: AppBlogCard(
                          date: 'Mar 10, 2020',
                          category: 'Sales',
                          title: 'How to use search engine optimization to drive sales',
                          description: 'Optio cum necessitatibus dolor voluptatum provident commodi et. Qui aperiam fugiat nemo cumque.',
                          authorName: 'Lindsay Walton',
                          authorRole: 'Front-end Developer',
                        ),
                      ),
                      SizedBox(width: 32),
                      Expanded(
                        child: AppBlogCard(
                          date: 'Feb 12, 2020',
                          category: 'Business',
                          title: 'Improve your customer experience',
                          description: 'Cupiditate maiores ullam eveniet adipisci in doloribus nulla minus. Voluptas iusto libero adipisci rem et corporis.',
                          authorName: 'Tom Cook',
                          authorRole: 'Director of Product',
                        ),
                      ),
                    ],
                  ),
                );
              }

              // Mobile/Tablet Stack
              return const Column(
                children: [
                  AppBlogCard(
                    date: 'Mar 16, 2020',
                    category: 'Marketing',
                    title: 'Boost your conversion rate',
                    description: 'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde.',
                    authorName: 'Michael Foster',
                    authorRole: 'Co-Founder / CTO',
                  ),
                  SizedBox(height: 48),
                  AppBlogCard(
                    date: 'Mar 10, 2020',
                    category: 'Sales',
                    title: 'How to use search engine optimization to drive sales',
                    description: 'Optio cum necessitatibus dolor voluptatum provident commodi et. Qui aperiam fugiat nemo cumque.',
                    authorName: 'Lindsay Walton',
                    authorRole: 'Front-end Developer',
                  ),
                  SizedBox(height: 48),
                  AppBlogCard(
                    date: 'Feb 12, 2020',
                    category: 'Business',
                    title: 'Improve your customer experience',
                    description: 'Cupiditate maiores ullam eveniet adipisci in doloribus nulla minus. Voluptas iusto libero adipisci rem et corporis.',
                    authorName: 'Tom Cook',
                    authorRole: 'Director of Product',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
