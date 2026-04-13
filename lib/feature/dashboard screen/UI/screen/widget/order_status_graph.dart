import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/containers/circular_container.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/helpers/helper_functions.dart';
import 'package:yt_ecommerce_admin_panel/feature/dashboard%20screen/logic/dashboard_cubit.dart';

class OrderStatusGraph extends StatelessWidget {
  const OrderStatusGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: BlocConsumer<DashboardCubit, DashboardState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order Status',
                  style: Theme.of(context).textTheme.headlineSmall),
              const Gap(TSizes.spaceBtwSections),
              SizedBox(
                height: 400,
                child: PieChart(
                  PieChartData(
                      sections: state.orderStatusDate.entries.map((e) {
                        final status = e.key;
                        final count = e.value;
                        return PieChartSectionData(
                          title: count.toString(),
                          value: count.toDouble(),
                          radius: 100,
                          color: THelperFunctions.getOrderStatusColor(status),
                          titleStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        );
                      }).toList(),
                      pieTouchData: PieTouchData(
                        touchCallback:
                            (FlTouchEvent event, pieTouchResponse) {},
                        enabled: true,
                      )),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: DataTable(
                    columns: const [
                      DataColumn(
                        label: Text('Status'),
                      ),
                      DataColumn(
                        label: Text('Orders'),
                      ),
                      DataColumn(
                        label: Text('Total'),
                      ),
                    ],
                    rows: state.orderStatusDate.entries.map((e) {
                      final status = e.key;
                      final count = e.value;
                      final totalAmount = state.totalAmounts[status] ?? 0;
                      return DataRow(cells: [
                        DataCell(
                          Row(
                            children: [
                              TCircularContainer(
                                width: 20,
                                height: 20,
                                backgroundColor:
                                    THelperFunctions.getOrderStatusColor(status),
                              ),
                              Expanded(
                                child: Text('$status'),
                              ),
                            ],
                          ),
                        ),
                        DataCell(Text(count.toString())),
                        DataCell(Text("\$${totalAmount.toStringAsFixed(2)}")),
                      ]);
                    }).toList()),
              )
            ],
          );
        },
      ),
    );
  }
}
