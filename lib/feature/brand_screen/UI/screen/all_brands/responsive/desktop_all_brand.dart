import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:yt_ecommerce_admin_panel/feature/brand_screen/UI/screen/all_brands/table/date_table_brand.dart';

import '../../../../../../core/common/widgets/breadcrumb/breadrumb_with_heading.dart';
import '../../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../../core/common/widgets/data_table/table_header.dart';
import '../../../../../../core/routes/routing_helper.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../category_screen/UI/screen/category_screen/table/data_table.dart';

class DesktopAllBrandScreen extends StatelessWidget {
  const DesktopAllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBreadcrumbWithHeading(
                  heading: "Brands", breadcrumbItems: ['Brands']),
              const Gap(TSizes.spaceBtwItems),
              TRoundedContainer(
                child: Column(
                  children: [
                    TableHeader(
                        buttonText: 'Create New Brand',
                        onPressed: () =>
                            context.push(TRoutingHelper.createBrandScreen)),
                    Gap(TSizes.spaceBtwItems),

                    const BrandTable()
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
