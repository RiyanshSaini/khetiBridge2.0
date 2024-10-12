import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kheti_project2/features/authentication/screens/login/temporary_main_screen.dart';

import '../../../data/repository/authentication/authentication_repository.dart';


class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);

    if (isVerified) {
      Get.offAll(const TemporaryMainScreen());  // Navigate to Dashboard on success
    } else {
      Get.back();  // Go back on failure
    }
  }
}
