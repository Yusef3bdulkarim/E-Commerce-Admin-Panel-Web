import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:yt_ecommerce_admin_panel/core/service_git_it/service_locator.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/enums.dart';

import '../data/model/ImageModel.dart';
import '../data/model/category_model.dart';
import '../data/repo/media_repo.dart'; // ضروري جداً عشان Uint8List

part 'media_state.dart';

class MediaCubit extends Cubit<MediaState> {
  final MediaRepo repo = getIt<MediaRepo>();

  MediaCubit() : super(MediaState());

  Future<void> uploadImages() async {
    if (state.selectImage.isEmpty) return;
    emit(state.copyWith(uploadStatus: MediaStatus.loading));
    try {
      final uploadTasks = state.selectImage.map((image) {
        final img = image;
        return repo.uploadImageFileInStorage(
          file: img.localIamgeToDisplay!,
          path: state.selectedUploadCategory.name,
          imageName: img.fileName,
          category: state.selectedUploadCategory.name,
        );
      }).toList();

      await Future.wait(uploadTasks);

      emit(state.copyWith(uploadStatus: MediaStatus.loaded, selectImage: []));
      getCategoryImages(state.selectedGalleryCategory);
    } catch (e) {
      emit(state.copyWith(
          uploadStatus: MediaStatus.error, message: e.toString()));
    }
  }

  Future<void> getCategoryImages(MediaCategory category) async {
    emit(state.copyWith(getImagesStatus: MediaStatus.loading));
    try {
      final images = await repo.getImagesFromFirestore(category.name);
      emit(state.copyWith(
          getImagesStatus: MediaStatus.loaded, fetchedImages: images));
    } catch (e) {
      emit(state.copyWith(
          getImagesStatus: MediaStatus.error, message: e.toString()));
    }
  }

  // Future<void> fetchCategory() async {
  //   try {
  //     final category = await repo.fetchCategories();
  //     emit(state.copyWith(allCategories: category));
  //   } catch (e) {
  //     emit(state.copyWith(status: MediaStatus.error, message: e.toString()));
  //   }
  // }

  List<CategoryModel> get subCategory => state.allCategories
      .where((e) => e.parentId == state.selectedParentCategory?.id)
      .toList();

  void selectUploadCategory(MediaCategory? category) {
    if (category != null) {
      emit(state.copyWith(selectedUploadCategory: category));
    }
  }

  void selectGalleryCategory(MediaCategory? category) {
    if (category != null) {
      emit(state.copyWith(selectedGalleryCategory: category));
      getCategoryImages(category);
    }
  }

  Future<void> deleteImage(Imagemodel image) async {
    final originalList = state.fetchedImages;
    final updatedImages =
        originalList.where((img) => img.id != image.id).toList();
    emit(state.copyWith(fetchedImages: updatedImages));

    try {
      // 2. احذفها من السيرفر في الخلفية
      await repo.deletImageFromStorageAndFirestore(image);
    } catch (e) {
      emit(state.copyWith(
          getImagesStatus: MediaStatus.error, message: e.toString()));
    }
  }

  // داخل MediaCubit
  void pickImages(
      List<dynamic> files, DropzoneViewController controller) async {
    List<Imagemodel> currentImages = List.from(state.selectImage);

    for (var file in files) {
      // تحويل الملف لـ Bytes عشان نعرضه في الويب
      final data = await controller.getFileData(file);
      final filename = await controller.getFilename(file);

      // بنعمل Model مؤقت عشان العرض
      final imageModel = Imagemodel(
          url: '',
          folder: '',
          fileName: filename,
          localIamgeToDisplay: data // هنا الداتا الحقيقية
          );

      currentImages.add(imageModel);
    }

    emit(state.copyWith(
      selectImage: currentImages,
    ));
  }

  void removedAll() {
    emit(state.copyWith(selectImage: [], uploadStatus: MediaStatus.initial));
  }

  void showUploader() {
    emit(state.copyWith(showUploader: true));
  }

  void toggleImageSelection(Imagemodel image) {
    final currentSelected = List<Imagemodel>.from(state.selectedCheckBoxImages);
    final index = currentSelected.indexWhere((item) => item.id == image.id);
    if (index != -1) {
      currentSelected.removeAt(index);
    } else {
      currentSelected.add(image);
    }
    emit(state.copyWith(selectedCheckBoxImages: currentSelected));
  }
  void clearSelection() {
    emit(state.copyWith(selectedCheckBoxImages: []));
  }
}
