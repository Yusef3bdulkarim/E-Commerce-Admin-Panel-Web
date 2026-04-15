import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/colors.dart';

import '../../../../../../core/common/widgets/chips/rounded_choice_chips.dart';
import '../../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../../core/common/widgets/images/image_uploader.dart';
import '../../../../../../core/utils/constants/enums.dart';
import '../../../../../../core/utils/constants/image_strings.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/validators/validation.dart';

class CreateBannerForm extends StatelessWidget {
  const CreateBannerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      width: 500,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(TSizes.sm),
            Text(
              'Create New Banner',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Gap(TSizes.spaceBtwInputFields * 2),
            Column(
              children: [
                TRoundedImage(
                  imageType: ImageType.asset,
                  width: 400,
                  height: 200,
                  backgroundColor: TColors.primaryBackground,
                  image: TImages.defaultImage,
                ),
                Gap(TSizes.spaceBtwItems),
                TextButton(
                  onPressed: () {},
                  child: const Text('Select Image'),
                ),
              ],
            ),
            Gap(TSizes.spaceBtwInputFields),
            Text(
              'Make your Banner Active or InActive',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Gap(TSizes.spaceBtwInputFields),
            CheckboxMenuButton(
              value: true,
              onChanged: (_) {},
              child: const Text('Active'),
            ),
            Gap(TSizes.spaceBtwInputFields),
            DropdownButton<String>(
              items: const [
                DropdownMenuItem<String>(
                  value: 'home',
                  child: Text('Home'),
                ),
                DropdownMenuItem<String>(
                  value: 'search',
                  child: Text('search'),
                ),
              ],
              onChanged: (String? newValue) {},
              value: 'search',
            ),
           
            Gap(TSizes.spaceBtwInputFields * 2),
            SizedBox(
              width: double.infinity,
              child:
                  ElevatedButton(onPressed: () {}, child: const Text('Create')),
            ),
            Gap(TSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }
}
