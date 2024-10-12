import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../controller/onboarding_controller.dart';
import 'OnBoardingPage.dart';
import 'OnBoardingPageSkip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: RImages.onBoardingImage1,
                title: 'onBoardingTitle1'.tr,  // Localized Title
                subTitle: 'onBoardingSubTitle1'.tr,  // Localized Subtitle
              ),
              OnBoardingPage(
                image: RImages.onBoardingImage1,
                title: 'onBoardingTitle2'.tr,  // Localized Title
                subTitle: 'onBoardingSubTitle2'.tr,  // Localized Subtitle
              ),
              OnBoardingPage(
                image: RImages.onBoardingImage1,
                title: 'onBoardingTitle3'.tr,  // Localized Title
                subTitle: 'onBoardingSubTitle3'.tr,  // Localized Subtitle
              ),
              // Add more pages here as needed
            ],
          ),

          // SKIP Button:
          const OnBoardingPageSkip(),
          // // Dot Navigation SmoothController:
          // const OnBoardingDotNavigation(),
          // // Next Button:
          // const OnBoardingNextButtion(),
        ],
      ),
    );
  }
}

