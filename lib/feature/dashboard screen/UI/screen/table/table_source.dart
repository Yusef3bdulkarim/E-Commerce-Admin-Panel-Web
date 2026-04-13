import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_html/js.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/helpers/helper_functions.dart';
import 'package:yt_ecommerce_admin_panel/feature/dashboard%20screen/logic/dashboard_cubit.dart';

import '../../../data/model/order_model.dart';

class OrderRows extends DataTableSource {
  final List<OrderModel> orders;
  final BuildContext context;

  OrderRows(this.orders, this.context);

  @override
  DataRow? getRow(int index) {
    if (index >= orders.length) return null;
    final order = orders[index];
    return DataRow2(cells: [
      DataCell(
        Text(
          order.id,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .apply(color: TColors.primary),
        ),
      ),
      DataCell(Text(order.formattedOrderDate)),
      const DataCell(Text('5 Items')),
      DataCell(
        TRoundedContainer(
          radius: TSizes.cardRadiusSm,
          padding: const EdgeInsets.symmetric(
              vertical: TSizes.xs, horizontal: TSizes.md),
          backgroundColor: THelperFunctions.getOrderStatusColor(order.status)
              .withOpacity(0.1),
          child: Text(
            order.status.name.toUpperCase().toString(),
            style: TextStyle(
                color: THelperFunctions.getOrderStatusColor(order.status)),
          ),
        ),
      ),
      DataCell(
        Text('\$${order.totalAmount}'),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => orders.length;

  @override
  int get selectedRowCount => 0;
}
