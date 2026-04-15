import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/feature/banner_screen/UI/screen/create_banner/widget/create_banner_form.dart';
import 'package:yt_ecommerce_admin_panel/feature/banner_screen/UI/screen/edit_banner/widget/edit_banner_form.dart';

import '../../../../../../core/common/widgets/breadcrumb/breadrumb_with_heading.dart';
import '../../../../../../core/routes/routing_helper.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../brand_screen/UI/screen/create_brand/widget/create_brand_form.dart';

class DesktopCreateBannerScreen extends StatelessWidget {
  const DesktopCreateBannerScreen({super.key});

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
              heading: 'Create Banner',
              breadcrumbItems: [TRoutingHelper.brandScreen, "Create Brand"],
              returnToPreviousScreen: true,
            ),
            Gap(TSizes.spaceBtwSections),
            CreateBannerForm(),
          ],
        ),
      ),
    ));
  }
}
