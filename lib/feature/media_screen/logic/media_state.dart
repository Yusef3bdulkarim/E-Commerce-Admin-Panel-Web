part of 'media_cubit.dart';

enum MediaStatus { initial, loading, loaded, error }

@immutable
class MediaState extends Equatable {
  final MediaStatus uploadStatus;
  final MediaStatus getImagesStatus;
  final String message;
  final List<Imagemodel> selectImage;
  final MediaCategory selectedUploadCategory;
  final MediaCategory selectedGalleryCategory;
  final List<Imagemodel> fetchedImages;
  final List<CategoryModel> allCategories;
  final CategoryModel? selectedParentCategory;
  final CategoryModel? selectedSubCategory;
  final bool showUploader;
  final List<Imagemodel> selectedCheckBoxImages; // الصور المختارة حالياً
  const MediaState(
      {this.uploadStatus = MediaStatus.initial,
      this.getImagesStatus = MediaStatus.initial,
      this.message = "",
      this.selectImage = const [],
      this.selectedUploadCategory = MediaCategory.folders,
      this.selectedGalleryCategory = MediaCategory.folders,
      this.fetchedImages = const [],
      this.allCategories = const [],
      this.selectedParentCategory,
      this.selectedSubCategory,
      this.showUploader = false,
      this.selectedCheckBoxImages = const []});

  MediaState copyWith({
    MediaStatus? uploadStatus,
    MediaStatus? getImagesStatus,
    String? message,
    List<Imagemodel>? selectImage,
    List<Imagemodel>? selectedCheckBoxImages,
    List<Imagemodel>? fetchedImages,
    MediaCategory? selectedUploadCategory,
    MediaCategory? selectedGalleryCategory,
    List<CategoryModel>? allCategories, // كل الكاتيجوريز من فايربيز
    CategoryModel? selectedParentCategory, // الملابس مثلاً
    CategoryModel? selectedSubCategory,
    bool? showUploader,
  }) {
    return MediaState(
        uploadStatus: uploadStatus ?? this.uploadStatus,
        getImagesStatus: getImagesStatus ?? this.getImagesStatus,
        message: message ?? this.message,
        selectedGalleryCategory:
            selectedGalleryCategory ?? this.selectedGalleryCategory,
        selectedUploadCategory:
            selectedUploadCategory ?? this.selectedUploadCategory,
        selectImage: selectImage ?? this.selectImage,
        fetchedImages: fetchedImages ?? this.fetchedImages,
        allCategories: allCategories ?? this.allCategories,
        selectedParentCategory:
            selectedParentCategory ?? this.selectedParentCategory,
        selectedSubCategory: selectedSubCategory ?? this.selectedSubCategory,
        showUploader: showUploader ?? this.showUploader,
        selectedCheckBoxImages:
            selectedCheckBoxImages ?? this.selectedCheckBoxImages);
  }

  @override
  List<Object?> get props => [
        uploadStatus,
        getImagesStatus,
        message,
        selectImage,
        selectedUploadCategory,
        selectedGalleryCategory,
        fetchedImages,
        allCategories,
        selectedSubCategory,
        selectedParentCategory,
        showUploader,
        selectedCheckBoxImages
      ];
}
