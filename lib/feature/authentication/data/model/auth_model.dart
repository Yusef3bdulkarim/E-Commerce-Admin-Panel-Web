import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/enums.dart';

class AuthModel extends Equatable {
  final String? id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String imageUser;
  final AppRole role;

  AuthModel({
    this.id,
    required this.userName,
    required this.email,
    required this.role,
    required this.firstName,
    required this.lastName,
    this.imageUser = '',
  });

  static AuthModel empty() => AuthModel(
        id: '',
        firstName: '',
        lastName: '',
        userName: '',
        email: '',
        imageUser: '',
        role: AppRole.admin,
      );

  factory AuthModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      return AuthModel(
          id: document.id,
          userName: data['userName'] ?? "",
          email: data['email'] ?? "",
          role: AppRole.values.firstWhere(
                (e) => e.name == (data['role'] ?? 'admin'),
            orElse: () => AppRole.admin,
          ),
          firstName: data['firstName'],
          lastName: data['lastName']);
    } else {
      return AuthModel.empty();
    }
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'userName': userName,
        'email': email,
        'role': role.name,
        'imageUser': imageUser,
      };

  String get fullName => '$firstName $lastName';

  @override
  List<Object?> get props =>
      [id, imageUser, firstName, lastName, email, role, userName];
}
