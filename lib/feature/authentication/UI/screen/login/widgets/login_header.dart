
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/utils/constants/image_strings.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/constants/text_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Image(
            image: AssetImage(TImages.darkAppLogo),
            width: 100,
            height: 100,
          ),
          const Gap(TSizes.spaceBtwItems),
          Text(
            TTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Gap(TSizes.sm),
          Text(
            TTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
