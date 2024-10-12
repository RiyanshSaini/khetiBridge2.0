import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/constants/text_strings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_function.dart';
import '../../controller/sign_up_controller.dart';

// class SignupTermsAndCondition extends StatefulWidget {
//   const SignupTermsAndCondition({super.key});
//
//   @override
//   _SignupTermsAndConditionState createState() => _SignupTermsAndConditionState();
// }
//
// class _SignupTermsAndConditionState extends State<SignupTermsAndCondition> {
//   bool _privacyPolicyAccepted = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final bool dark = THelperFunctions.isDarkMode(context);
//
//     return Row(
//       children: [
//         SizedBox(
//           width: 24,
//           height: 24,
//           child: Checkbox(
//             value: _privacyPolicyAccepted,
//             onChanged: (value) {
//               setState(() {
//                 _privacyPolicyAccepted = value!;
//               });
//             },
//           ),
//         ),
//         const SizedBox(width: 10), // Updated space for better layout
//         Expanded(
//           child: Text.rich(
//             TextSpan(
//               children: [
//                 TextSpan(
//                   text: '${'iAgreeTo '.tr} ', // Translated "I agree to"
//                   style: Theme.of(context).textTheme.bodySmall,
//                 ),
//                 TextSpan(
//                   text: '${'privacyPolicy'.tr} ', // Translated "Privacy Policy"
//                   style: Theme.of(context).textTheme.bodyMedium!.apply(
//                     color: TColors.primary,
//                     decoration: TextDecoration.underline,
//                     decorationColor: dark ? TColors.white : TColors.primary,
//                   ),
//                 ),
//                 TextSpan(
//                   text: ' ${'and '.tr} ', // Translated "and"
//                   style: Theme.of(context).textTheme.bodySmall,
//                 ),
//                 TextSpan(
//                   text: 'termsOfUse'.tr, // Translated "Terms of Use"
//                   style: Theme.of(context).textTheme.bodyMedium!.apply(
//                     color: TColors.primary,
//                     decoration: TextDecoration.underline,
//                     decorationColor: dark ? TColors.white : TColors.primary,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


class SignupTermsAndCondition2 extends StatelessWidget {
  const SignupTermsAndCondition2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = RHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Obx(
              () =>
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: controller.privacyPolicy.value,
                  onChanged: (value) =>
                  controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
                ),
              ),
        ),
        const SizedBox(width: RSizes.spaceBtwItems),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${'iAgreeTo '.tr} ', // Translated "I agree to"
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                ),
                TextSpan(
                  text: '${'privacyPolicy'.tr} ', // Translated "Privacy Policy"
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                    color: RColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? RColors.white : RColors.primary,
                  ),
                ),
                TextSpan(
                  text: ' ${'and '.tr} ', // Translated "and"
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                ),
                TextSpan(
                  text: 'termsOfUse'.tr, // Translated "Terms of Use"
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                    color: RColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? RColors.white : RColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

