import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String id;
  final String name;
  final String parentId;
  final String image;

  const CategoryModel({required this.id, required this.name, this.parentId = '', this.image = ''});

  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return CategoryModel(
      id: doc.id,
      name: data['Name'] ?? '',
      parentId: data['parentId'] ?? '',
      image: data['Image'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name, parentId, image];
}