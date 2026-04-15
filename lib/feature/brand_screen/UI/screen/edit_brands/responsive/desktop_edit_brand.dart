import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/common/widgets/breadcrumb/breadrumb_with_heading.dart';
import '../../../../../../core/routes/routing_helper.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../create_brand/widget/create_brand_form.dart';

class DesktopEditBrandScreen extends StatelessWidget {
  const DesktopEditBrandScreen({super.key});

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
              heading: 'Update Brands',
              breadcrumbItems: [TRoutingHelper.brandScreen, "Update Brand"],
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
