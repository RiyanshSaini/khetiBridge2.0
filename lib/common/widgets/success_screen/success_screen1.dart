import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../utils/constants/size.dart';
import '../../style/spacing_style.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: RSpacingStyle.paddingWithAppBarHeight * 2,
          // Assuming TSpacingStyle is predefined
          child: Column(
            children: [
              /// Image

              Lottie.asset(image,
                  width: MediaQuery.of(context).size.width * 0.6),
              // Image(
              //   image: AssetImage(image),
              //   width: THelperFunctions.screenWidth() * 0.8,
              // ),
              const SizedBox(height: RSizes.spaceBtwSections),

              /// Title
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),

              /// Subtitle
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: RSizes.spaceBtwSections),

              /// Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: Text('continueButton'.tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
