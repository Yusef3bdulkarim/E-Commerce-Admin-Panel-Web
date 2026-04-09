import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../feature/dashboard screen/data/model/product_model.dart';
import '../../../utils/constants/colors.dart';

class ProductRowsSource extends DataTableSource {
  final List<ProductModel> data;
  final List<String> selectedRows;
  final Function(String id, bool selected) onSelectRow;

  ProductRowsSource({
    required this.data,
    required this.selectedRows,
    required this.onSelectRow,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;
    final product = data[index];

    return DataRow2(
      selected: selectedRows.contains(product.id),
      onSelectChanged: (val) => onSelectRow(product.id ?? '', val ?? false),
      cells: [
        DataCell(Text(product.name ?? '',
            style: const TextStyle(color: TColors.primary))),
        DataCell(Text('\$${product.price}')),
        DataCell(Text(product.stock.toString())),
        DataCell(IconButton(onPressed: () {}, icon: const Icon(Iconsax.edit))),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => selectedRows.length;
}
