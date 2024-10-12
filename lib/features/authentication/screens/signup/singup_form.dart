import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kheti_project2/features/authentication/screens/login/temporary_main_screen.dart';
import 'package:kheti_project2/features/authentication/screens/signup/terms_and_condition_checkbox.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../../../utils/validations/validators.dart';
import '../../controller/sign_up_controller.dart';

class TSignupForm2 extends StatelessWidget {
  const TSignupForm2({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = RHelperFunctions.isDarkMode(context);

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// First & Last Name Row
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      RValidator.validateEmptyText('First name', value),
                  decoration: InputDecoration(
                    labelText: 'firstName'.tr, // Translated First Name
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: RSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      RValidator.validateEmptyText('Last name', value),
                  decoration: InputDecoration(
                    labelText: 'lastName'.tr, // Translated Last Name
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: RSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                RValidator.validateEmptyText('Username', value),
            decoration: InputDecoration(
              labelText: 'username'.tr, // Translated Username
              prefixIcon: const Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: RSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => RValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: 'email'.tr, // Translated Email
              prefixIcon: const Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: RSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => RValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: 'phoneNumber'.tr, // Translated Phone Number
              prefixIcon: const Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: RSizes.spaceBtwInputFields),

          /// Password
          Obx(
                () => TextFormField(
              controller: controller.password,
              validator: (value) => RValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: 'password'.tr, // Translated Password
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: Icon(controller.hidePassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                  onPressed: () => controller.hidePassword.value =
                  !controller.hidePassword.value,
                ),
              ),
            ),
          ),
          const SizedBox(height: RSizes.spaceBtwSections),

          /// Terms and Conditions Row
          const SignupTermsAndCondition2(),
          const SizedBox(height: RSizes.spaceBtwSections),

          /// Sign Up Button (Modified to include OTP verification logic)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                if (controller.signupFormKey.currentState!.validate()) {
                  // Trigger email and password registration
                  await controller.signup();

                  // Once signup is successful, trigger OTP for phone authentication
                  controller.phoneAuthentication(
                      controller.phoneNumber.text.trim());
                  Get.to(() => const TemporaryMainScreen());
                } else {
                  RLoaders.errorSnackBar(
                    title: "Invalid Input",
                    message:
                    "Please fill in all required fields with valid data.",
                  );
                }
              },
              child: Text('createAccount'.tr), // Translated Create Account
            ),
          ),
        ],
      ),
    );
  }
}
