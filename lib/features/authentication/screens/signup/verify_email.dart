import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../common/widgets/success_screen/success_screen1.dart';
import '../../../../data/repository/authentication/authentication_repository.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/size.dart';

import '../../../../utils/helpers/helper_function.dart';
import '../../controller/verify_email_controller.dart';
import '../login/login.dart';
// Assuming CupertinoIcons is imported

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Padding to give default equal space on all sides
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(RImages.deliveredEmailIllustration),
                width: RHelperFunctions.screenWidth() * 0.8,
              ),
              const SizedBox(height: RSizes.spaceBtwSections),

              /// Title
              Text(
                'confirmEmail'.tr,  // Translated Title
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),

              /// Email Display
              Text(
                email ?? ' ',  // Placeholder email (This could be localized or dynamic if needed)
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),

              /// Subtitle
              Text(
                'confirmEmailSubTitle'.tr,  // Translated Subtitle
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: RSizes.spaceBtwSections),

              /// Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: Text('continueButton'.tr),  // Translated Continue Button Text
                ),
              ),
              const SizedBox(height: RSizes.spaceBtwItems),

              /// Resend Email Button
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () =>  controller.sendEmailVerification,
                  child: Text('resendEmail'.tr),  // Translated Resend Email Button Text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

