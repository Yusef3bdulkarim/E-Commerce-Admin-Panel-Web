import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/common/widgets/breadcrumb/breadrumb_with_heading.dart';
import '../../../../../../core/routes/routing_helper.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../widget/create_brand_form.dart';

class MobileCreateBrandScreen extends StatelessWidget {
  const MobileCreateBrandScreen({super.key});

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
