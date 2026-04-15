import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/images/t_circular_image.dart';
import 'package:yt_ecommerce_admin_panel/core/routes/routing_helper.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'menu/menu_item.dart';

class TSliderbar extends StatelessWidget {
  const TSliderbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: TColors.white,
          border: Border(
            right: BorderSide(color: TColors.grey, width: 1),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TCircularImage(
                width: 100,
                height: 100,
                image: TImages.darkAppLogo,
                backgroundColor: Colors.transparent,
              ),
              const Gap(TSizes.spaceBtwItems),
              Padding(
                padding: const EdgeInsetsGeometry.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'MENU',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(letterSpacingDelta: 1.2),
                    ),
                    const TMenuItem(
                      text: 'Dashboard',
                      icon: Iconsax.status,
                      route: TRoutingHelper.dashboard,
                    ),
                    const TMenuItem(
                      text: 'Media',
                      icon: Iconsax.image,
                      route: TRoutingHelper.media,
                    ),

                    const TMenuItem(
                      text: 'Category',
                      icon: Iconsax.category_2,
                      route: TRoutingHelper.categoryScreen,
                    ),
                    const TMenuItem(
                      text: 'Brands',
                      icon: Iconsax.dcube,
                      route: TRoutingHelper.brandScreen,
                    ),
                    const TMenuItem(
                      text: 'Banner',
                      icon: Iconsax.picture_frame,
                      route: TRoutingHelper.bannerScreen,
                    ),
                    const TMenuItem(
                      text: 'logout',
                      icon: Iconsax.logout,
                      route: TRoutingHelper.bannerScreen,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
