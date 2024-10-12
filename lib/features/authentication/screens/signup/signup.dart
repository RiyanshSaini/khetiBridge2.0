import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kheti_project2/features/authentication/screens/signup/singup_form.dart';


import '../../../../common/widgets/form_divider.dart';
import '../../../../common/widgets/social_button.dart';
import '../../../../utils/constants/size.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                'signUpTitle'.tr, // Replacing TTexts.signUpTitle with translated key
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: RSizes.spaceBtwSections),

              /// Form
              const TSignupForm2(),
              const SizedBox(height: RSizes.spaceBtwSections),

              /// Divider
              TFormDivider(dividerText: 'orSignUpWith'.tr.capitalize!), // Replacing TTexts.orSignUpWith

              const SizedBox(height: RSizes.spaceBtwSections),

              /// Social Buttons
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
