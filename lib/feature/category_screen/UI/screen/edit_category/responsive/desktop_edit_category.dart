import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/feature/category_screen/UI/screen/edit_category/widget/edit_category_form.dart';
import 'package:yt_ecommerce_admin_panel/feature/media_screen/data/model/category_model.dart';

import '../../../../../../core/common/widgets/breadcrumb/breadrumb_with_heading.dart';
import '../../../../../../core/routes/routing_helper.dart';

class DesktopEditCategoryScreen extends StatelessWidget {
  const DesktopEditCategoryScreen({
    super.key,
  });

  // final CategoryModel category;
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
                  heading: "Update Category",
                  returnToPreviousScreen: true,
                  breadcrumbItems: [
                    TRoutingHelper.categoryScreen,
                    'Update Category'
                  ]),
              Gap(TSizes.spaceBtwSections),
EditCategoryForm()
            ],
          ),
        ),
      ),
    );
  }
}
