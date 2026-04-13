import 'dart:io';
import 'dart:typed_data'; // ضروري جداً عشان Uint8List
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/formatters/formatter.dart';
class Imagemodel extends Equatable {
  String id;
  final String url;
  final String folder;
  final int? sizeBytes;
  String mediaCategory;
  final String fileName;
  final String? fullPath;
  final DateTime? createdAt;
  final DateTime? updateAt;
  final String? contentType;
  final File? file;
  bool isSelected;
  final Uint8List? localIamgeToDisplay;

  Imagemodel({
    this.id = '',
    required this.url,
    required this.folder,
    this.sizeBytes,
    required this.fileName,
    this.fullPath,
    this.createdAt,
    this.updateAt,
    this.contentType,
    this.file,
    this.localIamgeToDisplay,
    this.mediaCategory = '',
    this.isSelected = false,
  });

  static Imagemodel empty() => Imagemodel(url: '', folder: '', fileName: '');

  String get createdAtFormatted => TFormatter.formatDate(createdAt);

  String get uploadedAtFormatted => TFormatter.formatDate(updateAt);

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'folder': folder,
      'sizeBytes': sizeBytes,
      'fileName': fileName,
      'fullPath': fullPath,
      'createdAt': createdAt?.toUtc(),
      'contectType': contentType,
      'mediaCategory': mediaCategory,
    };
  }

  factory Imagemodel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Imagemodel(
      id: document.id,
      url: data['url'] ?? '',
      folder: data['folder'] ?? '',
      fileName: data['fileName'] ?? '',
      mediaCategory: data['mediaCategory'] ?? '',
      sizeBytes: data['sizeBytes'],
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
    );
  }

  factory Imagemodel.fromFirebaseMetadata(FullMetadata metadata, String folder,
      String filename, String downloadUrl) {
    return Imagemodel(
      url: downloadUrl,
      folder: folder,
      fileName: filename,
      sizeBytes: metadata.size,
      contentType: metadata.contentType,
      fullPath: metadata.fullPath,
      createdAt: metadata.timeCreated,
      updateAt: metadata.updated,
    );
  }

  @override
  List<Object?> get props => [
        id,
        url,
        folder,
        fileName,
        mediaCategory,
        sizeBytes,
        createdAt,
        updateAt,
        contentType,
        file,
        isSelected,
        localIamgeToDisplay,
        fullPath
      ];
}
