import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/device/device_utility.dart';

import '../../../../utils/constants/sizes.dart';

class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({this.scaffoldKey, super.key});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: TColors.white,
        border: Border(
          bottom: BorderSide(color: TColors.grey, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.md, vertical: TSizes.sm),
      child: AppBar(
        leading: !TDeviceUtils.isDesktopScreen(context)
            ? IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.menu),
              )
            : null,
        title: SizedBox(
          width: 400,
          child: TDeviceUtils.isDesktopScreen(context)
              ? TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.search_normal),
                      hintText: 'Search anything...'),
                )
              : null,
        ),
        actions: [
          if (TDeviceUtils.isDesktopScreen(context))
            IconButton(
                onPressed: () {}, icon: const Icon(Iconsax.search_normal)),
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
          const Gap(TSizes.spaceBtwItems / 2),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TRoundedImage(
                imageType: ImageType.asset,
                image: TImages.user,
              ),
            ],
          ),
          const Gap(TSizes.spaceBtwItems / 2),
          if (!TDeviceUtils.isMobileScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yusef 3bdulkarim',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Support@gmail.com',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(TDeviceUtils.getAppBarHeight() + 15);
}
