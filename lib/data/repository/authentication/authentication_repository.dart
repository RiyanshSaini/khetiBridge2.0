import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import 'package:get/get.dart';
import 'package:kheti_project2/common/widgets/loaders/loaders.dart';

import '../../../common/widgets/temp_screen.dart';
import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/signup/verify_email.dart';
import '../../../features/authentication/screens/widgets/onboarding.dart';
import '../../../utils/exceptions/fireabase_auth_exception.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/format_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    super.onReady();
    // screenRedirect(); Uncomment this if you want to navigate automatically on startup.
  }

  // Function to Show Relevant Screen:
  Future<void> screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const TempScreen());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      if (kDebugMode) {
        print('=================== GET STORAGE AUTH REPO ==================');
        print(deviceStorage.read('IsFirstTime'));
      }

      deviceStorage.writeIfNull('IsFirstTime', true);
      bool isFirstTime = deviceStorage.read('IsFirstTime') ?? false;
      Get.offAll(
              () => isFirstTime ? const OnBoardingScreen() : const LoginScreen());
    }
  }

  /// Helper function to format phone numbers
  String formatPhoneNumber(String phoneNo) {
    if (!phoneNo.startsWith('+')) {
      // Default country code is +91 (India); adjust based on target region.
      phoneNo = '+91$phoneNo';
    }
    return phoneNo;
  }

  /// Phone authentication using Firebase
  Future<void> phoneAuthentication(String phoneNo) async {
    phoneNo = formatPhoneNumber(phoneNo);
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Automatically sign in when verification is completed
          try {
            await _auth.signInWithCredential(credential);
            RLoaders.successSnackBar(title: 'Success', message: 'Automatically signed in.');
          } catch (e) {
            RLoaders.errorSnackBar(title: 'Error', message: 'Failed to sign in automatically.');
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId.value = verificationId;
          RLoaders.successSnackBar(title: 'Code Sent', message: 'Verification code has been sent.');
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle auto timeout
          this.verificationId.value = verificationId;
          RLoaders.warningSnackBar(
              title: 'Timeout', message: 'OTP auto-retrieval timed out. Please enter the code manually.');
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            RLoaders.warningSnackBar(title: 'Error', message: 'The provided phone number is not valid.');
          } else {
            RLoaders.errorSnackBar(title: 'Error', message: 'Verification failed: ${e.message}');
          }
        },
      );
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Error', message: 'Unexpected error during phone authentication: $e');
    }
  }

  /// OTP Verification
  Future<bool> verifyOTP(String otp) async {
    try {
      var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationId.value,
          smsCode: otp,
        ),
      );

      if (credentials.user != null) {
        RLoaders.successSnackBar(title: 'Success', message: 'OTP verified successfully.');
        return true;
      } else {
        RLoaders.errorSnackBar(title: 'Error', message: 'OTP verification failed. Please try again.');
        return false;
      }
    } on FirebaseAuthException catch (e) {
      RLoaders.errorSnackBar(title: 'Error', message: 'Failed to verify OTP: ${e.message}');
      return false;
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Error', message: 'Unexpected error: $e');
      return false;
    }
  }

  /// Register user with email and password
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.code} - ${e.message}");
      throw RFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      print("FirebaseException: ${e.code} - ${e.message}");
      throw RFirebaseException(e.code).message;
    } on FormatException catch (e) {
      print("FormatException: Invalid format");
      throw const RFormatException();
    } on PlatformException catch (e) {
      print("PlatformException: ${e.code} - ${e.message}");
      throw RPlatformException(e.code).message;
    } catch (e) {
      print("Unexpected error: $e");
      throw 'Something went wrong. Please try again';
    }
  }

  /// Email verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw RFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw RFirebaseException(e.code).message;
    } on FormatException {
      throw const RFormatException();
    } on PlatformException catch (e) {
      throw RPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Logout function
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw RFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw RFirebaseException(e.code).message;
    } on FormatException {
      throw const RFormatException();
    } on PlatformException catch (e) {
      throw RPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
