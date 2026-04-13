import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/feature/dashboard%20screen/UI/screen/table/data_table.dart';
import 'package:yt_ecommerce_admin_panel/feature/dashboard%20screen/UI/screen/widget/dashboard_card.dart';
import 'package:yt_ecommerce_admin_panel/feature/dashboard%20screen/UI/screen/widget/order_status_graph.dart';

import '../widget/weekly_sales_gragh.dart';

class DashboardDesktop extends StatelessWidget {
  const DashboardDesktop({super.key});

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
                const Gap(TSizes.spaceBtwItems),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [TWeeklySalesGragh()],
                  ),
                ),
                Gap(TSizes.spaceBtwSections),
                Expanded(
                  child: Column(
                    children: [
                      OrderStatusGraph(),
                    ],
                  ),
                ),
              ],
            ),
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
          ],
        ),
      ),
    );
  }
}
