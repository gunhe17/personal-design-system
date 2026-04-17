import 'package:flutter/material.dart';
import '../atoms/app_stat_item.dart';

class AppStatsSection extends StatelessWidget {
  const AppStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: AppStatItem(label: 'Transactions every 24 hours', value: '44 million')),
                  Expanded(child: AppStatItem(label: 'Assets under holding', value: '\$119 trillion')),
                  Expanded(child: AppStatItem(label: 'New users annually', value: '46,000')),
                ],
              );
            }
            return const Column(
              children: [
                AppStatItem(label: 'Transactions every 24 hours', value: '44 million'),
                SizedBox(height: 48),
                AppStatItem(label: 'Assets under holding', value: '\$119 trillion'),
                SizedBox(height: 48),
                AppStatItem(label: 'New users annually', value: '46,000'),
              ],
            );
          },
        ),
      ),
    );
  }
}
