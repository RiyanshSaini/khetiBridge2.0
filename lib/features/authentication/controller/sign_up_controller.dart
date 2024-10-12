import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repository/authentication/authentication_repository.dart';
import '../../../data/repository/user/user_repository.dart';
import '../../../data/services/network_manager.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../models/user_model.dart';
import '../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  // Singleton instance of SignupController
  static SignupController get instance => Get.find();

  // Text Editing Controllers for form fields
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  // Form key for signup form validation
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Signup method to handle user registration
  Future<void> signup() async {
    try {
      RFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        RImages.successfullyRegisterAnimation,
      );
      // Internet connectivity check.
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        RLoaders.errorSnackBar(
          title: 'No Internet',
          message: 'Please check your internet connection and try again.',
        );
        return; // This return might stop dialog dismissal, ensure `finally` block runs.
      }

      // Form Validation.
      if (!signupFormKey.currentState!.validate()) {
        RLoaders.errorSnackBar(
          title: 'Invalid Input',
          message: 'Please check your inputs and try again.',
        );
        return;
      }

      if (!privacyPolicy.value) {
        RLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'You must accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // Register the user in Firebase Authentication
      final userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Save the user data in Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      await UserRepository.instance.saveUserRecord(newUser);

      RLoaders.successSnackBar(
        title: 'Account Created',
        message: 'Your account has been successfully created.',
      );

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        RLoaders.errorSnackBar(
          title: 'Email Already Registered',
          message: 'The email you entered is already in use.',
        );
      } else {
        RLoaders.errorSnackBar(
          title: 'Registration Error',
          message: e.message ?? 'Something went wrong during registration.',
        );
      }
    } catch (e) {
      RLoaders.errorSnackBar(
        title: "Oh Snap!",
        message: e.toString(),
      );
    } finally {
      // Ensure dialog closes even if there is an error
      print("Stopping loading dialog...");
      RFullScreenLoader.stopLoading();
    }
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
