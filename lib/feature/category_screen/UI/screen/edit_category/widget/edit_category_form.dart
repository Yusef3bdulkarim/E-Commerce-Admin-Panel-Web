import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../../core/common/widgets/images/image_uploader.dart';
import '../../../../../../core/utils/constants/enums.dart';
import '../../../../../../core/utils/constants/image_strings.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/validators/validation.dart';

class EditCategoryForm extends StatelessWidget {
  const EditCategoryForm({super.key});

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
              'Update Category',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Gap(TSizes.spaceBtwInputFields * 2),
            TextFormField(
              validator: (value) => TValidator.validateEmptyText("Name", value),
              decoration: const InputDecoration(
                labelText: 'Category Name',
                prefixIcon: Icon(Iconsax.category),
              ),
            ),
            Gap(TSizes.spaceBtwInputFields * 2),
            DropdownButtonFormField(
                decoration: InputDecoration(
                    hintText: 'Parent Category',
                    labelText: "Parent Category",
                    prefixIcon: Icon(Iconsax.bezier)),
                items: [
                  DropdownMenuItem(
                      value: "",
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [Text("item.name")],
                      ))
                ],
                onChanged: (_) {}),
            Gap(TSizes.spaceBtwInputFields * 2),
            TImageUploader(
              imageType: ImageType.asset,
              width: 80,
              height: 80,
              image: TImages.defaultImage,
              onIconButtonPressed: () {},
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
