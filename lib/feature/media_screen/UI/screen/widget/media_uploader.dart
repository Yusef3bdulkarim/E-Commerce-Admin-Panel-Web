import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/device/device_utility.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/popups/dialogs.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/popups/loaders.dart';

import '../../../data/model/ImageModel.dart';
import '../../../logic/media_cubit.dart';
import 'folder_dropdown.dart';

class MediaUploader extends StatefulWidget {
  const MediaUploader({super.key});

  @override
  State<MediaUploader> createState() => _MediaUploaderState();
}

class _MediaUploaderState extends State<MediaUploader> {
  DropzoneViewController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaCubit, MediaState>(
      listener: (context, state) {
        if (state.uploadStatus == MediaStatus.error) {
          if (Navigator.of(context, rootNavigator: true).canPop()) {
            Navigator.of(context, rootNavigator: true).pop();
          }
          TLoaders.errorSnackBar(
              context: context, title: "Oh Snap !!", message: state.message);
        }

        if (state.uploadStatus == MediaStatus.loading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => PopScope(
              canPop: false,
              child: AlertDialog(
                title: const Text('Uploading Images'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      TImages.uploadingImageIllustration,
                      height: 300,
                      width: 300,
                    ),
                    Gap(TSizes.spaceBtwItems),
                    const Text('Sit Thight , Your images are uploading...')
                  ],
                ),
              ),
            ),
          );
        }
        if (state.uploadStatus == MediaStatus.loaded) {
          if (Navigator.of(context, rootNavigator: true).canPop()) {
            Navigator.of(context, rootNavigator: true).pop();
          }
        }
      },
      builder: (context, state) {
        final cubit = context.read<MediaCubit>();
        return Column(
          children: [
            TRoundedContainer(
              showBorder: true,
              height: 250,
              borderColor: TColors.borderPrimary,
              backgroundColor: TColors.primaryBackground,
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        DropzoneView(
                          mime: ['image/jpeg', 'image/png'],
                          cursor: CursorType.Default,
                          operation: DragOperation.copy,
                          onLoaded: () => print("Zone loaded"),
                          onError: (ev) => print("Zone error:$ev"),
                          onHover: () => print('Zone hoverd'),
                          onLeave: () => print('Zone left'),
                          onCreated: (ctrl) => controller = ctrl,
                          onDrop: (file) =>
                              cubit.pickImages([file], controller!),
                          onDropInvalid: (ev) =>
                              print('Zone invalid MIME : $ev'),
                          onDropMultiple: (ev) =>
                              print('Zone drop multiple:$ev'),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              TImages.defaultMultiImageIcon,
                              width: 50,
                              height: 50,
                            ),
                            Gap(TSizes.spaceBtwItems),
                            Text('Drag and Drop Images here'),
                            Gap(TSizes.spaceBtwItems),
                            OutlinedButton(
                              onPressed: () async {
                                if (controller != null) {
                                  final events = await controller!.pickFiles();
                                  if (events.isNotEmpty)
                                    cubit.pickImages(events, controller!);
                                }
                              },
                              child: const Text('Select Images'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(TSizes.spaceBtwItems),
            if (state.selectImage.isNotEmpty)
              TRoundedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Select Folder',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const Gap(TSizes.spaceBtwItems),
                            FolderDropdownScreen(
                              onChanged: (MediaCategory? newValue) {
                                if (newValue != null) {
                                  cubit.selectUploadCategory(newValue);
                                }
                              },
                              selcetedValue: state.selectedUploadCategory,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () => cubit.removedAll(),
                              child: const Text('Remove All'),
                            ),
                            Gap(TSizes.spaceBtwItems),
                            TDeviceUtils.isMobileScreen(context)
                                ? const SizedBox.shrink()
                                : SizedBox(
                                    width: TSizes.buttonWidth,
                                    child: ElevatedButton(
                                      onPressed: state.selectImage.isNotEmpty
                                          ? () {
                                              if (state
                                                      .selectedUploadCategory ==
                                                  MediaCategory.folders) {
                                                TLoaders.warningSnackBar(
                                                    context: context,
                                                    title: "Select Folder",
                                                    message:
                                                        'Please select the Folder in Order to Upload the images');
                                                return;
                                              }
                                              TDialogs.defaultDialog(
                                                  context: context,
                                                  title: 'Upload Images',
                                                  confirmText: "Confirm Upload",
                                                  onConfirm: () async {
                                                    context.pop();
                                                    cubit.uploadImages();
                                                  },
                                                  content:
                                                      'Are you sure you want to upload all the images in ${state.selectedUploadCategory.name.toUpperCase()}');
                                            }
                                          : null,
                                      child: const Text('Upload'),
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(TSizes.spaceBtwItems),
                    Wrap(
                        alignment: WrapAlignment.start,
                        spacing: TSizes.spaceBtwItems / 2,
                        runSpacing: TSizes.spaceBtwItems / 2,
                        children: state.selectImage.map((image) {
                          final img = image as Imagemodel;
                          return TRoundedImage(
                            imageType: ImageType.memory,
                            memoryImage: img.localIamgeToDisplay,
                            width: 90,
                            height: 90,
                            padding: TSizes.sm,
                            backgroundColor: TColors.primaryBackground,
                          );
                        }).toList()),
                    Gap(TSizes.spaceBtwSections),
                    TDeviceUtils.isMobileScreen(context)
                        ? SizedBox(
                            width: TSizes.buttonWidth,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Upload'),
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ),
            const Gap(TSizes.spaceBtwSections),
          ],
        );
      },
    );
  }
}
