import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helpers/helper_function.dart';
import '../icons/circular_icon.dart';

class RProductQuantityWithAddAndRemoveButton extends StatelessWidget {
  const RProductQuantityWithAddAndRemoveButton({super.key, this.quantity = 1});

  final int quantity;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = RHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 70), // Spacer before buttons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Remove Button
            RCircularIcon(
              icon: Iconsax.minus,
              width: 40,
              height: 40,
              size: RSizes.md,
              color: isDarkMode ? RColors.white : RColors.black,
              backgroundColor: isDarkMode ? RColors.darkerGrey : RColors.light,
            ),
            const SizedBox(width: RSizes.spaceBtwItems),

            // Quantity Display
            Text(
              '$quantity',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(width: RSizes.spaceBtwItems),

            // Add Button
            const RCircularIcon(
              icon: Iconsax.add,
              width: 40,
              height: 40,
              size: RSizes.md,
              color: RColors.white,
              backgroundColor: RColors.primary,
            ),
          ],
        ),
      ],
    );
  }
}
