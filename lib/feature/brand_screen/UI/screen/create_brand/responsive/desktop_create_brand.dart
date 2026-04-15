import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/breadcrumb/breadrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/core/routes/routing_helper.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/feature/brand_screen/UI/screen/create_brand/widget/create_brand_form.dart';

class DesktopCreateBrandScreen extends StatelessWidget {
  const DesktopCreateBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TBreadcrumbWithHeading(
              heading: 'Create Brands',
              breadcrumbItems: [TRoutingHelper.brandScreen, "Create Brand"],
              returnToPreviousScreen: true,
            ),
            Gap(TSizes.spaceBtwSections),
            CreateBrandForm(),
          ],
        ),
      ),
    ));
  }
}
