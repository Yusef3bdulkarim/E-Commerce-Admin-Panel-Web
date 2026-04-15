import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/common/widgets/breadcrumb/breadrumb_with_heading.dart';
import '../../../../../../core/routes/routing_helper.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../widget/edit_banner_form.dart';

class DesktopEditBannerScreen extends StatelessWidget {
  const DesktopEditBannerScreen({super.key});

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
              heading: 'Update Banner',
              breadcrumbItems: [TRoutingHelper.bannerScreen, "Update Brand"],
              returnToPreviousScreen: true,
            ),
            Gap(TSizes.spaceBtwSections),
            EditBannerForm(),
          ],
        ),
      ),
    ));
  }
}
