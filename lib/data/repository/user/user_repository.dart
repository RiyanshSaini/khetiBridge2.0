import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/authentication/models/user_model.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/format_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';

class UserRepository extends GetxController {
  /// Singleton instance to access UserRepository via GetX
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      // Handle Firebase-specific exceptions
      throw RFirebaseException(e.code).message;
    } on FormatException {
      // Handle any formatting issues
      throw const RFormatException();
    } on PlatformException catch (e) {
      // Handle platform-specific exceptions
      throw RPlatformException(e.code).message;
    } catch (e) {
      // General catch-all for unexpected errors
      throw 'Something went wrong. Please try again';
    }
  }
}
