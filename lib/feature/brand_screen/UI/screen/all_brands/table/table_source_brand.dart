import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/icons/table_action_icon_buttons.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/core/routes/routing_helper.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/device/device_utility.dart';

class BrandRow extends DataTableSource {
  final BuildContext context;

  BrandRow({
    required this.context,
  });

  @override
  DataRow? getRow(int index) {
    return DataRow2(cells: [
      DataCell(
        Row(
          children: [
            TRoundedImage(
              imageType: ImageType.asset,
              width: 50,
              height: 50,
              padding: TSizes.sm,
              image: TImages.acerlogo,
              borderRadius: TSizes.borderRadiusMd,
              backgroundColor: TColors.primaryBackground,
            ),
            Gap(TSizes.spaceBtwItems),
            Expanded(
              child: Text(
                'Adidas',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: TColors.primary),
              ),
            ),
          ],
        ),
      ),
      DataCell(Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            spacing: TSizes.xs,
            direction: TDeviceUtils.isMobileScreen(context)
                ? Axis.vertical
                : Axis.horizontal,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom:
                        TDeviceUtils.isMobileScreen(context) ? 0 : TSizes.xs),
                child: const Chip(
                  label: Text('shoes'),
                  padding: EdgeInsets.all(TSizes.xs),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom:
                        TDeviceUtils.isMobileScreen(context) ? 0 : TSizes.xs),
                child: const Chip(
                  label: Text('TrackSuits'),
                  padding: EdgeInsets.all(TSizes.xs),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom:
                        TDeviceUtils.isMobileScreen(context) ? 0 : TSizes.xs),
                child: const Chip(
                  label: Text('Joggers'),
                  padding: EdgeInsets.all(TSizes.xs),
                ),
              ),
            ],
          ),
        ),
      )),
      DataCell(Icon(
        Iconsax.heart5,
        color: TColors.primary,
      )),
      DataCell(Text(DateTime.now().toString())),
      DataCell(TTableActionButtons(
        onEditPressed: () => context.push(TRoutingHelper.editBrandScreen),
        onDeletePressed: () {},
      ))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount =>20 ;

  @override
  int get selectedRowCount => 0;
}
