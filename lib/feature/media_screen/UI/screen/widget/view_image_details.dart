import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/device/device_utility.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/popups/loaders.dart';

import '../../../../../core/utils/popups/dialogs.dart';
import '../../../data/model/ImageModel.dart';
import '../../../logic/media_cubit.dart';

class ViewImageDetails extends StatelessWidget {
  const ViewImageDetails({super.key, required this.image});

  final Imagemodel image;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg)),
        child: TRoundedContainer(
          width: TDeviceUtils.isDesktopScreen(context)
              ? MediaQuery.of(context).size.width * 0.4
              : double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.spaceBtwItems),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Stack(
                    children: [
                      TRoundedContainer(
                        backgroundColor: TColors.primaryBackground,
                        child: TRoundedImage(
                          imageType: ImageType.network,
                          image: image.url,
                          applyImageRadius: true,
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: TDeviceUtils.isDesktopScreen(context)
                              ? MediaQuery.of(context).size.width * 0.4
                              : double.infinity,
                        ),
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                              onPressed: () => context.pop(),
                              icon: Icon(Iconsax.close_circle)))
                    ],
                  ),
                ),
                const Divider(),
                Gap(TSizes.spaceBtwItems),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'imageName',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
                    Expanded(
                        flex: 3,
                        child: Text(
                          image.fileName,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .apply(overflow: TextOverflow.ellipsis),
                        )),
                  ],
                ),
                Gap(TSizes.spaceBtwItems),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Image URL',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
                    Expanded(
                        flex: 2,
                        child: Text(
                          image.url,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .apply(overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                        )),
                    Expanded(
                        child: OutlinedButton(
                            onPressed: () {
                              FlutterClipboard.copy(image.url).then((val) =>
                                  TLoaders.customToast(
                                      context: context, message: 'URL copied'));
                            },
                            child: const Text("Copy URL")))
                  ],
                ),
                Gap(TSizes.spaceBtwItems),
                ElevatedButton.icon(

                  onPressed: () {
                    // يفضل تظهر Dialog تأكيد أولاً (Confirm Dialog)
                    TDialogs.defaultDialog(
                        context: context,
                        onConfirm: () async {
                          Navigator.pop(context);
                          context.read<MediaCubit>().deleteImage(image);
                          Navigator.pop(context);
                        });
                  },
                  icon: const Icon(Iconsax.trash, color: TColors.error),
                  label: const Text('Delete Image'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.error.withOpacity(0.1),
                      foregroundColor: TColors.error,

                  ),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
