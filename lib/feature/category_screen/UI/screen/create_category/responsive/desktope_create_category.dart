import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/breadcrumb/breadrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/core/routes/routing_helper.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/feature/category_screen/UI/screen/create_category/create_category.dart';
import 'package:yt_ecommerce_admin_panel/feature/category_screen/UI/screen/create_category/widget/create_category_form.dart';

class DesktopeCreateCategoryScreen extends StatelessWidget {
  const DesktopeCreateCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBreadcrumbWithHeading(
                  heading: "Create Category",
                  returnToPreviousScreen: true,
                  breadcrumbItems: [
                    TRoutingHelper.categoryScreen,
                    'Create Category'
                  ]),
              Gap(TSizes.spaceBtwSections),
              TCreateCategoryForm(),
            ],
          ),
        ),
      ),
    );
  }
}
