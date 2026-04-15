import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/breadcrumb/breadrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/data_table/table_header.dart';
import 'package:yt_ecommerce_admin_panel/core/routes/routing_helper.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/feature/category_screen/UI/screen/category_screen/table/data_table.dart';

class DesktopCategoryScreen extends StatelessWidget {
  const DesktopCategoryScreen({super.key});

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
                  heading: "Category", breadcrumbItems: ['Categories']),
              const Gap(TSizes.spaceBtwItems),
              TRoundedContainer(
                child: Column(
                  children: [
                    TableHeader(
                        buttonText: 'Create New Category',
                        onPressed: () =>
                            context.push(TRoutingHelper.createScreen)),
                    Gap(TSizes.spaceBtwItems),

                    const CategoryTable()
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
