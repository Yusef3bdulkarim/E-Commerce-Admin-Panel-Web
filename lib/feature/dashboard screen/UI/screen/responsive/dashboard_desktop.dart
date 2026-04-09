import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/device/device_utility.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/popups/loaders.dart';
import 'package:yt_ecommerce_admin_panel/feature/dashboard%20screen/UI/screen/widget/dashboard_card.dart';
import 'package:yt_ecommerce_admin_panel/feature/dashboard%20screen/logic/dashboard_cubit.dart';

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
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        TRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Weakly Sales',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Gap(TSizes.spaceBtwSections),
                              SizedBox(
                                  height: 420,
                                  child: BlocConsumer<DashboardCubit,
                                      DashboardState>(
                                    listener: (context, state) {
                                      if (state.status ==
                                          DashboardStatus.error) {
                                        TLoaders.errorSnackBar(
                                            context: context,
                                            title: "Oh Snap !!",
                                            message: "Please try again");
                                      }
                                    },
                                    builder: (context, state) {
                                      return BarChart(BarChartData(
                                        titlesData: buildFlTintlesData(),
                                        gridData: const FlGridData(
                                          show: true,
                                          drawHorizontalLine: true,
                                          drawVerticalLine: false,
                                          horizontalInterval: 200,
                                        ),
                                        barGroups: state.weaklySales
                                            .asMap()
                                            .entries
                                            .map((e) {
                                          return BarChartGroupData(
                                              x: e.key,
                                              barRods: [
                                                BarChartRodData(
                                                    toY: e.value,
                                                    color: TColors.primary,
                                                    width:25)
                                              ]);
                                        }).toList(),
                                        groupsSpace: TSizes.spaceBtwItems,
                                        barTouchData: BarTouchData(
                                            touchTooltipData:
                                                BarTouchTooltipData(
                                                    getTooltipColor: (_) =>
                                                        TColors.secondary),
                                            touchCallback:
                                                TDeviceUtils.isDesktopScreen(
                                                        context)
                                                    ? (barTouchEvent,
                                                        barTouchResponse) {}
                                                    : null),
                                      ));
                                    },
                                  ))
                            ],
                          ),
                        )
                      ],
                    )),
                Gap(TSizes.spaceBtwSections),
                Expanded(
                  child: Column(
                    children: [TRoundedContainer()],
                  ),
                )
              ],
            ),
            Gap(TSizes.spaceBtwSections),
            Column(
              children: [TRoundedContainer()],
            ),
          ],
        ),
      ),
    );
  }
}

FlTitlesData buildFlTintlesData() {
  return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (val, meta) {
              final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
              final index = val.toInt() % days.length;
              final day = days[index];
              return SideTitleWidget(
                meta: meta,
                // الصح إننا بناخدها من الـ meta اللي جاية في الـ parameter
                space: 10,
                // مسافة بين الـ Label والـ Chart
                child: Text(day,
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
              );
            }),
      ),
      leftTitles: const AxisTitles(
          sideTitles:
              SideTitles(showTitles: true, interval: 200, reservedSize: 50)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)));
}
