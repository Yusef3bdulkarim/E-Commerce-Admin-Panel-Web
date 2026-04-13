import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../table/data_table.dart';
import '../widget/dashboard_card.dart';
import '../widget/order_status_graph.dart';
import '../widget/weekly_sales_gragh.dart';

class DashboardTablet extends StatelessWidget {
  const DashboardTablet({super.key});

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
            Row(
              children: [
                Expanded(
                  child: TDashboardCard(
                      title: "Sales total", subTitle: "\$365.6", stats: 25),
                ),
                const Gap(TSizes.spaceBtwItems),
                Expanded(
                  child: TDashboardCard(
                      title: "Average Orders Value",
                      subTitle: "\$365.6",
                      stats: 25),
                ),
              ],
            ),
            const Gap(TSizes.spaceBtwSections),
            Row(
              children: [
                Expanded(
                  child: TDashboardCard(
                      title: "Total Orders", subTitle: "\$365.6", stats: 25),
                ),
                const Gap(TSizes.spaceBtwItems),
                Expanded(
                  child: TDashboardCard(
                      title: "Visitors", subTitle: "\$365.6", stats: 25),
                ),
              ],
            ),
            Gap(TSizes.spaceBtwSections),
            TWeeklySalesGragh(),
            Gap(TSizes.spaceBtwSections),
            TRoundedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Review",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Gap(TSizes.spaceBtwItems),
                  const DashboardOrderTable()
                ],
              ),
            ),
            Gap(TSizes.spaceBtwSections),
            OrderStatusGraph(),
          ],
        ),
      ),
    );
  }
}
