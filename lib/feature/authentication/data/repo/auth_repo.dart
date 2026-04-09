import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:yt_ecommerce_admin_panel/core/service_git_it/service_locator.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/exceptions/firebase_exceptions.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/data/model/auth_model.dart';
import '../../../../core/utils/exceptions/platform_exceptions.dart';

class AuthRepo {
  final auth = getIt<FirebaseAuth>();
  final _db = getIt<FirebaseFirestore>();

  Future<UserCredential> signInAdmin(String email, String pass) async {
    try {

      final userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      final adminDoc =
          await _db.collection("Admins").doc(userCredential.user!.uid).get();
      if (!adminDoc.exists) {
        await auth.signOut();
        throw "This email is not registered as an admin.";
      }
      return userCredential;
    }  on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (e is String) throw e;
      throw 'Something went wrong, please try again';
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      final adminQuery = await _db
          .collection("Admins")
          .where("email", isEqualTo: email)
          .get();

      if (adminQuery.docs.isEmpty) {
        throw "This email is not registered as an admin.";
      }
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (e is String) throw e;
      throw 'Something went wrong, please try again';
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  Future<void> createNewAdmin(AuthModel newAdmin, String password) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: newAdmin.email,
        password: password,
      );
      await _db
          .collection("Admins")
          .doc(credential.user!.uid)
          .set(newAdmin.toJson());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }
}
