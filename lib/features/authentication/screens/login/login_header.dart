import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/constants/text_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image Container (optional, commented-out parts can be restored if necessary)
        const SizedBox(
          width: double.infinity, // Takes up the entire width of the parent
          height: 250, // Keep the height if necessary
          child: Image(
            image: AssetImage("assets/icons/tempLogo.jpg"),
            fit: BoxFit.cover, // Ensures the image covers the entire width
          ),
        ),
        const SizedBox(height: RSizes.spaceBtwSections),

        // Use translated text for title
        Text(
          'loginTitle'.tr, // Replacing TTexts.loginTitle with translated key
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: RSizes.spaceBtwItems),

        // Use translated text for subtitle
        Text(
          'loginSubTitle'.tr, // Replacing TTexts.loginSubTitle with translated key
          style: const TextStyle(
            fontSize: RSizes.fontSizeSm,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}


// Container(
//   width: double.infinity,
//   height: 20.0,
//   decoration: const BoxDecoration(
//     gradient: LinearGradient(
//       colors: [
//         Color(0xFFC7DEC8), // Light greenish
//         Color(0xFF697C74), // Dark grayish
//         // Add as many colors as needed
//       ],
//       begin: Alignment.topRight, // Start from top-right
//       end: Alignment.bottomLeft, // End at bottom-left
//     ),
//   ),
// ),
// // IMage ;
// Container(
//   width: double.infinity,
//   height: 250,
//   decoration: const BoxDecoration(
//     gradient: LinearGradient(
//       colors: [
//         Color(0xFFC7DEC8), // Light greenish
//         Color(0xFF4A5A59), // Dark grayish
//         // Add as many colors as needed
//       ],
//       begin: Alignment.topRight, // Start from top-right
//       end: Alignment.bottomLeft, // End at bottom-left
//     )
//   ),
//   child: const Image(
//     image: AssetImage("assets/icons/tempLogoTrans2.png"),
//     fit: BoxFit.cover,
//   ),
// ),



