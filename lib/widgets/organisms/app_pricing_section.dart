import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../atoms/app_pricing_card.dart';
import '../atoms/app_section_header.dart';

class AppPricingSection extends StatelessWidget {
  const AppPricingSection({super.key});

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
        children: [
          const AppSectionHeader(
            title: 'Pricing',
            description: 'Choose the right plan for you. Best features for engaging your audience.',
            variant: AppSectionHeaderVariant.section,
          ),
          const SizedBox(height: 64),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 800;

              if (isWide) {
                return const IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: AppPricingCard(
                          tier: 'Hobby',
                          price: '\$29',
                          period: '/month',
                          description: 'The perfect plan if you\'re just getting started.',
                          features: [
                            '25 products',
                            'Up to 10,000 subscribers',
                            'Advanced analytics',
                            '24-hour support',
                          ],
                          buttonText: 'Get started today',
                        ),
                      ),
                      SizedBox(width: 32),
                      Expanded(
                        child: AppPricingCard(
                          tier: 'Enterprise',
                          price: '\$99',
                          period: '/month',
                          isEmphasized: true,
                          description: 'Dedicated support and infrastructure for your company.',
                          features: [
                            'Unlimited products',
                            'Unlimited subscribers',
                            'Advanced analytics',
                            'Dedicated representative',
                            'Marketing automations',
                            'Custom integrations',
                          ],
                          buttonText: 'Get started today',
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const Column(
                children: [
                  AppPricingCard(
                    tier: 'Hobby',
                    price: '\$29',
                    period: '/month',
                    description: 'The perfect plan if you\'re just getting started.',
                    features: [
                      '25 products',
                      'Up to 10,000 subscribers',
                      'Advanced analytics',
                      '24-hour support',
                    ],
                    buttonText: 'Get started today',
                  ),
                  SizedBox(height: 32),
                  AppPricingCard(
                    tier: 'Enterprise',
                    price: '\$99',
                    period: '/month',
                    isEmphasized: true,
                    description: 'Dedicated support and infrastructure for your company.',
                    features: [
                      'Unlimited products',
                      'Unlimited subscribers',
                      'Advanced analytics',
                      'Dedicated representative',
                      'Marketing automations',
                      'Custom integrations',
                    ],
                    buttonText: 'Get started today',
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
