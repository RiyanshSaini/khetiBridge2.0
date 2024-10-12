import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kheti_project2/features/authentication/screens/otp/opt_screen.dart';


import '../../../../utils/constants/size.dart';
import '../../../../utils/device/device_utils.dart';
import '../login/login.dart';

class OnBoardingPageSkip extends StatelessWidget {
  const OnBoardingPageSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: RDeviceUtils.getAppBarHeight() - 20,
      right: RSizes.defaultSpace + 18,
      child: GestureDetector(
        onTap: () {
          Get.to(() => OTPScreen()); // Navigate to the login screen on press
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1), // Slightly transparent background
            shape: BoxShape.rectangle, // Rectangle for oval shape
            borderRadius: BorderRadius.circular(30), // Oval shape
            border: Border.all(color: Colors.black.withOpacity(0.2)), // Optional border
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, // Fit the content
            children: [
              // Skip Text
              Text(
                "Skip".tr,
                style: const TextStyle(
                  color: Colors.black, // Text color
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8), // Space between text and icon

              // Forward Triangle Icon
              const Icon(
                Icons.keyboard_arrow_right, // Forward arrow icon
                color: Colors.black, // Icon color
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

}