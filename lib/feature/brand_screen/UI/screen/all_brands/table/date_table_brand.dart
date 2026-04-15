import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:yt_ecommerce_admin_panel/feature/brand_screen/UI/screen/all_brands/table/table_source_brand.dart';

import '../../../../../../core/common/widgets/data_table/paginated_data_table.dart';
import '../../../../../../core/utils/device/device_utility.dart';

class BrandTable extends StatelessWidget {
  const BrandTable({super.key});

  @override
  Widget build(BuildContext context) {
    return TPaginatedDataTable(
        minWidth: 700,
        tableHeight: 760,
        dataRowHeight: 64,
        columns: [
          DataColumn2(
              label: const Text('Brand'),
              fixedWidth: TDeviceUtils.isDesktopScreen(context) ? null : 200),
          const DataColumn2(
            label: Text('Categories'),
          ),
          DataColumn2(
              label: const Text('Featured'),
              fixedWidth: TDeviceUtils.isMobileScreen(context) ? null : 100),
          DataColumn2(
              label: const Text('Date'),
              fixedWidth: TDeviceUtils.isMobileScreen(context) ? null : 200),
          DataColumn2(
              label: const Text('Action'),
              fixedWidth: TDeviceUtils.isMobileScreen(context) ? null : 100),
        ],
        source: BrandRow(context: context));
  }
}
