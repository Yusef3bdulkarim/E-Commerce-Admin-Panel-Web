import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/chips/rounded_choice_chips.dart';

import '../../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../../core/common/widgets/images/image_uploader.dart';
import '../../../../../../core/utils/constants/enums.dart';
import '../../../../../../core/utils/constants/image_strings.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/validators/validation.dart';

class CreateBrandForm extends StatelessWidget {
  const CreateBrandForm({super.key});

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
              'Create New Brand',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Gap(TSizes.spaceBtwInputFields * 2),
            TextFormField(
              validator: (value) => TValidator.validateEmptyText("Name", value),
              decoration: const InputDecoration(
                labelText: 'Brand Name',
                prefixIcon: Icon(Iconsax.category),
              ),
            ),
            Gap(TSizes.spaceBtwInputFields),

            Text(
              'Select Category',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Gap(TSizes.spaceBtwInputFields / 2),
            Wrap(
              spacing: TSizes.sm,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: TSizes.sm),
                  child: TChoiceChip(
                    text: 'Shoes',
                    selected: true,
                    onSelected: (val) {},
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: TSizes.sm),
                  child: TChoiceChip(
                    text: 'Track Suits',
                    selected: true,
                    onSelected: (val) {},
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: TSizes.sm),
                  child: TChoiceChip(
                    text: 'Shoes',
                    selected: false,
                    onSelected: (val) {},
                  ),
                ),
              ],
            ),
            Gap(TSizes.spaceBtwInputFields * 2),
            TImageUploader(
              imageType: ImageType.asset,
              width: 80,
              height: 80,
              image: TImages.defaultImage,
              onIconButtonPressed: (){},
            ),
            Gap(TSizes.spaceBtwInputFields * 2),
            CheckboxMenuButton(
              value: true,
              onChanged: (_) {},
              child: const Text('Featured'),
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
