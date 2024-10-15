import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helper_function.dart';

class RSearchContainer extends StatelessWidget {
  const RSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.all(RSizes.md)
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final darkMode = RHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity, // Ensure full width
        padding: padding, // Padding inside the container
        decoration: BoxDecoration(
          color: showBackground
              ? darkMode
              ? RColors.gold1
              : RColors.greenShade100 // Soft green background
              : RColors.transparent,
          borderRadius: BorderRadius.circular(RSizes.cardRadiusLg * 2), // Rounded corners

        ),
        child: Row(
          children: [
            Icon(icon, color: RColors.emeraldGreen), // Dark green icon
            const SizedBox(width: RSizes.spaceBtwItems),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: RColors.darkGreen// Darker green text
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class RSearchContainer extends StatelessWidget {
//   const RSearchContainer({
//     super.key,
//     required this.text,
//     this.icon = Iconsax.search_normal,
//     this.showBackGround = true,
//     this.showBorder = true,
//     this.onTap,
//   });
//
//   final String text;
//   final IconData? icon;
//   final bool showBackGround, showBorder;
//   final VoidCallback? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     final darkMode = RHelperFunctions.isDarkMode(context);
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: RSizes.defaultSpace),
//         child: Container(
//           width: RDeviceUtils.getScreenWidth(context),
//           padding: const EdgeInsets.all(RSizes.md),
//           decoration: BoxDecoration(
//             color: showBackGround
//                 ? darkMode
//                     ? RColors.darkGreen
//                     : Colors.white
//                 : Colors.transparent,
//             borderRadius: BorderRadius.circular(RSizes.cardRadiusLg),
//             border: showBackGround ? Border.all(color: RColors.grey) : null,
//           ),
//           child: Row(
//             children: [
//               Icon(icon, color: RColors.darkerGrey),
//               const SizedBox(width: RSizes.spaceBtwItems),
//               Text(
//                 text,
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
