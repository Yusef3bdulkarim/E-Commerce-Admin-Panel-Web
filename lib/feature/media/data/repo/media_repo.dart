import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:yt_ecommerce_admin_panel/core/service_git_it/service_locator.dart';
import 'package:yt_ecommerce_admin_panel/feature/media/data/model/ImageModel.dart';

import '../model/category_model.dart';

class MediaRepo {
  final FirebaseStorage _storage = getIt<FirebaseStorage>();
  final FirebaseFirestore _db = getIt<FirebaseFirestore>();

  Future<Imagemodel> uploadImageFileInStorage({required Uint8List file,
    required String path,
    required String imageName,
    required String category}) async {
    print("Starting upload for: $imageName"); // ضيف ده للتأكد
    final ref = _storage.ref(path).child(imageName);
    await ref.putData(file);
    final url = await ref.getDownloadURL();
    print("Upload complete: $url");
    final metadata = await ref.getMetadata();
    final imageModel = Imagemodel(
        url: url,
        folder: path,
        fileName: imageName,
        mediaCategory: category,
        sizeBytes: metadata.size,
        fullPath: metadata.fullPath,
        createdAt: DateTime.now(),
        updateAt: DateTime.now());
    await _db.collection('Images').add(imageModel.toJson());
    return imageModel;
  }

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final snapshot =
      await FirebaseFirestore.instance.collection('Categories').get();
      final categories =
      snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
      return categories;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Imagemodel>> getImagesFromFirestore(String category) async {
    final snapshot = await _db
        .collection('Images')
        .where('mediaCategory', isEqualTo: category)
        .get();
    return snapshot.docs.map((doc) => Imagemodel.fromSnapshot(doc)).toList();
  }

  Future<void> deletImageFromStorageAndFirestore(Imagemodel image) async {
    try {
      final storageRef = _storage.refFromURL(image.url);
      await storageRef.delete();
      await _db.collection('Images').doc(image.id).delete();
    }catch(e){
      throw e.toString();
    }
  }
}
