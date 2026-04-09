import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/texts/section_heading.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/sizes.dart';

import '../../../../../core/utils/constants/colors.dart';

class TDashboardCard extends StatelessWidget {
  const TDashboardCard(
      {super.key,
      required this.title,
      required this.subTitle,
      this.icon = Iconsax.arrow_up_3,
      this.color = TColors.success,
      this.onTap,
      required this.stats});

  final String title, subTitle;
  final IconData icon;
  final Color color;
  final void Function()? onTap;
  final int stats;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      onTap: onTap,
      padding: EdgeInsets.all(TSizes.lg),
      child: Column(
        children: [
          TSectionHeading(
            title: title,
            textColor: TColors.textSecondary,
          ),
          const Gap(TSizes.spaceBtwSections),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(
                          icon,
                          color: color,
                          size: TSizes.iconSm,
                        ),
                        Text('$stats%'),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      'Compare to Dec 2025',

                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
