import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/breadcrumb/breadrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/core/routes/routing_helper.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/sizes.dart';

import '../../../logic/media_cubit.dart';
import '../widget/media_content.dart';
import '../widget/media_uploader.dart';

class MediaDesktop extends StatelessWidget {
  const MediaDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCubit, MediaState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TBreadcrumbWithHeading(
                        heading: 'Media',
                        breadcrumbItems: [
                          TRoutingHelper.media
                        ],
                      ),
                      SizedBox(
                        width: TSizes.buttonWidth * 1.5,
                        child: ElevatedButton.icon(
                          onPressed: () =>context.read<MediaCubit>().showUploader(),
                          label: const Text('Upload Images'),
                          icon: const Icon(Iconsax.cloud_add),
                        ),
                      )
                    ],
                  ),
                  Gap(TSizes.spaceBtwSections),
                  if(state.showUploader==true) MediaUploader(),

                  MediaContent(),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
