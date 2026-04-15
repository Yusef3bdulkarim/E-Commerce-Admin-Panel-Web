import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:yt_ecommerce_admin_panel/feature/banner_screen/UI/screen/all_banner/table/table_source_banner.dart';
import '../../../../../../core/common/widgets/data_table/paginated_data_table.dart';
import '../../../../../../core/utils/device/device_utility.dart';

class BannerTable extends StatelessWidget {
  const BannerTable({super.key});

  @override
  Widget build(BuildContext context) {
    return TPaginatedDataTable(
        minWidth: 700,
        tableHeight: 900,
        dataRowHeight: 110,
        columns: [
          DataColumn2(
            label: const Text('Banner'),
          ),
          const DataColumn2(
            label: Text('Redirect Screen'),
          ),
          DataColumn2(
            label: const Text('Active'),
          ),

          DataColumn2(label: const Text('Action'), fixedWidth: 100),
        ],
        source: BannerRow(context: context));
  }
}
