import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/device/device_utils.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../controller/onboarding_controller.dart';

class OnBoardingNextButtion extends StatelessWidget {
  const OnBoardingNextButtion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);

    return Positioned(
      right: RSizes.defaultSpace + 25, // Align to the right with default spacing
      bottom: RDeviceUtils.getBottomNavigationBarHeight(), // Positioned above the bottom navigation bar
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
          // Action for button press
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), // Circular button shape
          backgroundColor: Colors.green.shade200, // Button background color
        ),
        child: const Icon(
          Iconsax.arrow_right_3, // Icon from Iconsax
          color: Colors.white, // White color for the icon
        ),
      ),
    );
  }
}