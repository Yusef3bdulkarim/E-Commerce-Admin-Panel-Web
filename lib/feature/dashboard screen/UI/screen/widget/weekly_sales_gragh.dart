import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/device/device_utility.dart';
import '../../../../../core/utils/popups/loaders.dart';
import '../../../logic/dashboard_cubit.dart';

class TWeeklySalesGragh extends StatelessWidget {
  const TWeeklySalesGragh({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weakly Sales',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Gap(TSizes.spaceBtwSections),
          SizedBox(
            height: 420,
            child:
            BlocConsumer<DashboardCubit, DashboardState>(
              listener: (context, state) {
                if (state.status == DashboardStatus.error) {
                  TLoaders.errorSnackBar(
                      context: context,
                      title: "Oh Snap !!",
                      message: "Please try again");
                }
              },
              builder: (context, state) {
                return BarChart(BarChartData(
                  titlesData: buildFlTitlesData(),
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                    horizontalInterval: 200,
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                        top: BorderSide.none,
                        right: BorderSide.none),
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
                          width: 30,
                          borderRadius: BorderRadius.circular(
                              TSizes.sm),
                        ),
                      ],
                    );
                  }).toList(),
                  groupsSpace: TSizes.spaceBtwItems,
                  barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
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
            ),
          ),
        ],
      ),
    );
  }
}

FlTitlesData buildFlTitlesData() {
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
            space: 0,

            // مسافة بين الـ Label والـ Chart
            child: Text(
              day,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          );
        },
      ),
    ),
    leftTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: true, interval: 200, reservedSize: 50),
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
  );
}
