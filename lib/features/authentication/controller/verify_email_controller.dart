import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../common/widgets/success_screen/success_screen1.dart';
import '../../../data/repository/authentication/authentication_repository.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/constants/text_strings.dart';


class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification link
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      RLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your inbox and verify your email.',
      );
    } catch (e) {
      RLoaders.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    }
  }

  /// Set Timer to check email verification status periodically
  void setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
          (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;

        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(() => SuccessScreen(
            image: RImages.successfullyRegisterAnimation,
            title: RTexts.yourAccountCreatedTitle,
            subTitle: RTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
        }
      },
    );
  }

  /// Check Email Verification Status manually
  Future<void> checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
        image: RImages.successfullyRegisterAnimation,
        title: RTexts.yourAccountCreatedTitle,
        subTitle: RTexts.yourAccountCreatedSubTitle,
        onPressed: () => AuthenticationRepository.instance.screenRedirect( ),
      ));
    }
  }
}
