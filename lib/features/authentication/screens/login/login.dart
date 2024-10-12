import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kheti_project2/navigation_menu.dart';

import '../../../../common/widgets/social_button.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../signup/signup.dart';
import 'login_header.dart';
// Replace with actual path to SignupScreen

 // Make sure to import your helper files, translations, etc.

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Logo, Title & Sub-Title (Separate widget for the header)
            TLoginHeader(dark: dark),
            /// Padding around the login form and social buttons
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                children: [
                  /// Login Form
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: RSizes.spaceBtwSections,
                      ),
                      child: Column(
                        children: [
                          /// Email Field
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.mail_outline),
                              labelText: 'email'.tr, // Translate Email field
                            ),
                          ),
                          const SizedBox(height: RSizes.spaceBtwInputFields),

                          /// Password Field
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Iconsax.password_check),
                              labelText: 'password'.tr, // Translate Password field
                              suffixIcon: const Icon(Iconsax.eye_slash),
                            ),
                          ),
                          const SizedBox(height: RSizes.spaceBtwInputFields / 2),

                          /// Remember Me & Forget Password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(value: true, onChanged: (value) {}),
                                  Text('rememberMe'.tr), // Translate Remember Me
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text('forgotPassword'.tr), // Translate Forgot Password
                              ),
                            ],
                          ),
                          const SizedBox(height: RSizes.spaceBtwSections),

                          /// Sign In Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => const NavigationMenu());
                              },
                              child: Text('signIn'.tr), // Translate Sign In
                            ),
                          ),
                          const SizedBox(height: RSizes.spaceBtwItems),

                          /// Create Account Button
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () => Get.to(() => const SignupScreen()),
                              child: Text('createAccount'.tr), // Translate Create Account
                            ),
                          ),
                          const SizedBox(height: RSizes.spaceBtwSections),

                          /// OR Sign In With
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Divider(
                                  color: dark ? RColors.darkGrey : RColors.grey,
                                  thickness: 0.5,
                                  indent: 68,
                                  endIndent: 5,
                                ),
                              ),
                              Text(
                                'orSignInWith'.tr.capitalizeFirst!, // Translate Or Sign In With
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Flexible(
                                child: Divider(
                                  color: dark ? RColors.darkGrey : Colors.grey,
                                  thickness: 0.5,
                                  indent: 5,
                                  endIndent: 60,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: RSizes.spaceBtwItems),

                          /// Social Media Buttons
                          const SocialButtons(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
