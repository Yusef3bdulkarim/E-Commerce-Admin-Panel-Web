import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/loaders/animation_loader.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/loaders/loader_animation.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/feature/media_screen/UI/screen/widget/view_image_details.dart';
import '../../../../../core/common/widgets/images/t_rounded_image.dart';
import '../../../../../core/utils/popups/loaders.dart';
import '../../../data/model/ImageModel.dart';
import '../../../logic/media_cubit.dart';
import 'folder_dropdown.dart';

class MediaContent extends StatelessWidget {
  const MediaContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaCubit, MediaState>(
      listener: (context, state) {
        if (state.getImagesStatus == MediaStatus.error) {
          TLoaders.errorSnackBar(
              context: context,
              title: "Error Loading Images",
              message: state.message);
        }
        if (state.getImagesStatus == MediaStatus.loading &&
            state.selectImage.isEmpty) TLoaderAnimation();
      },
      builder: (context, state) {
        return TRoundedContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'Gallery Folder',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Gap(TSizes.spaceBtwItems),
                  FolderDropdownScreen(
                    onChanged: (MediaCategory? newValue) {
                      if (newValue != null) {
                        context
                            .read<MediaCubit>()
                            .selectGalleryCategory(newValue);
                        context
                            .read<MediaCubit>()
                            .getCategoryImages(newValue); // عشان يحدث الجاليري
                      }
                    },
                    selcetedValue: state.selectedGalleryCategory,
                  ),
                ],
              ),
              Gap(TSizes.spaceBtwSections),
              if (state.fetchedImages.isEmpty)
                _buildEmptyAnimationWidget(context)
              else
                Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: state.fetchedImages
                      .map((image) => GestureDetector(
                            key: ValueKey(image.id),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      ViewImageDetails(image: image));
                            },
                            child: SizedBox(
                              width: 140,
                              height: 180,
                              child: Column(
                                children: [
                                  _buildSimpleList(image),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: TSizes.sm / 2),
                                      child: Text(
                                        image.fileName,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: TSizes.buttonWidth,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          return showMediaPicker(context);
                        },
                        label: const Text('load More'),
                        icon: const Icon(Iconsax.arrow_down),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyAnimationWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1),
      child: TAnimationLoaderWidget(
        text: 'Select your Desired Folder',
        animation: TImages.packageAnimation,
        width: 300,
        height: 300,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _buildSimpleList(Imagemodel image) {
    return TRoundedImage(
      imageType: ImageType.network,
      width: 140,
      height: 140,
      padding: TSizes.sm,
      image: image.url,
      margin: TSizes.spaceBtwItems / 2,
      backgroundColor: TColors.primaryBackground,
    );
  }
}

void showMediaPicker(BuildContext context) {
  DropzoneViewController? controller;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) => BlocProvider.value(
      value: context.read<MediaCubit>(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TRoundedContainer(
              showBorder: true,
              height: 250,
              width: double.infinity,
              borderColor: TColors.borderPrimary,
              backgroundColor: TColors.primaryBackground,
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
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
                              onPressed: () async {},
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
            BlocBuilder<MediaCubit, MediaState>(
              builder: (context, state) {
                return TRoundedContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Select Folder',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Gap(TSizes.spaceBtwItems),
                              FolderDropdownScreen(
                                onChanged: (MediaCategory? newValue) {
                                  if (newValue != null) {
                                    context
                                        .read<MediaCubit>()
                                        .selectGalleryCategory(newValue);
                                    context
                                        .read<MediaCubit>()
                                        .getCategoryImages(newValue);
                                  }
                                },
                                selcetedValue: state.selectedGalleryCategory,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 120,
                                child: OutlinedButton.icon(
                                  label: const Text('Close'),
                                  icon: const Icon(Iconsax.close_circle),
                                  onPressed: () => context.pop(),
                                ),
                              ),
                              Gap(TSizes.spaceBtwItems),
                              SizedBox(
                                width: 120,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  label: const Text('Add Images'),
                                  icon: const Icon(Iconsax.image),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Gap(TSizes.spaceBtwSections),
                      if (state.fetchedImages.isEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1),
                          child: TAnimationLoaderWidget(
                            text: 'Select your Desired Folder',
                            animation: TImages.packageAnimation,
                            width: 250,
                            height: 250,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: state.fetchedImages
                            .map((image) => GestureDetector(
                                  key: ValueKey(image.id),
                                  onTap: () {
                                    context
                                        .read<MediaCubit>()
                                        .toggleImageSelection(image);
                                  },
                                  child: SizedBox(
                                    width: 140,
                                    height: 180,
                                    child: Stack(
                                      children: [
                                        TRoundedImage(
                                          imageType: ImageType.network,
                                          width: 140,
                                          height: 140,
                                          padding: TSizes.sm,
                                          image: image.url,
                                          margin: TSizes.spaceBtwItems / 2,
                                          backgroundColor:
                                              TColors.primaryBackground,
                                        ),
                                        Positioned(
                                          top: TSizes.md,
                                          right: TSizes.md,
                                          child: Checkbox(
                                            value: state.selectedCheckBoxImages
                                                .any((item) =>
                                                    item.id == image.id),
                                            onChanged: (val) {
                                              if (val != null) {
                                                context
                                                    .read<MediaCubit>()
                                                    .toggleImageSelection(
                                                        image);
                                              }
                                            },
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          child: Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal:
                                                          TSizes.sm / 2),
                                              child: Text(
                                                image.fileName,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: TSizes.spaceBtwSections),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: TSizes.buttonWidth,
                              child: ElevatedButton.icon(
                                onPressed: () => showMediaPicker(context),
                                label: const Text('load More'),
                                icon: const Icon(Iconsax.arrow_down),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    ),
  );
}
