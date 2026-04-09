import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../widget/dashboard_card.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Gap(TSizes.spaceBtwSections),
            TDashboardCard(
                title: "Sales total", subTitle: "\$365.6", stats: 25),
            const Gap(TSizes.spaceBtwItems),
            TDashboardCard(
                title: "Average Orders Value",
                subTitle: "\$365.6",
                stats: 25),
            const Gap(TSizes.spaceBtwItems),
            TDashboardCard(
                title: "Total Orders", subTitle: "\$365.6", stats: 25),
            const Gap(TSizes.spaceBtwItems),
            TDashboardCard(
                title: "Visitors", subTitle: "\$365.6", stats: 25)
          ],
        ),
      ),
    );
  }
}
