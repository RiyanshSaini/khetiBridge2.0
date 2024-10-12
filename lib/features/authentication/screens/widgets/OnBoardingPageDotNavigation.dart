import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/device/device_utils.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../controller/onboarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = RHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: RDeviceUtils.getBottomNavigationBarHeight() + 100,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.center,
        child: SmoothPageIndicator(
          controller: controller.pageController, // The PageController for your onboarding pages
          count: 3, // Number of pages in your onboarding
          onDotClicked: (index) => controller.dotNavigationClick(index), // Function to handle dot clicks
          effect: ScrollingDotsEffect( // Using ExpandingDotsEffect for the dot animation
            activeDotColor: dark ? RColors.light : Colors.green, // Dot color based on the theme
            dotHeight: 8, // Dot height
            dotWidth: 8, // Dot width// Expansion factor when active
          ),
        ),
      ),
    );
  }
}
