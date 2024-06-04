import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco/features/personalization/models/user_model.dart';
import 'package:eco/utils/exceptions/firebase_exceptions.dart';
import 'package:eco/utils/exceptions/format_exceptions.dart';
import 'package:eco/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Repository class for user related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data in the firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Function to fetch user details based on user ID.
  

  /// Function to update user data in the firestore.
  
  /// Update any field in specific Users Collection.
}
