import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helpers/helper_function.dart';
import '../custom_shapes/containers/custom_rounded_container.dart';


class RCouponCode extends StatelessWidget {
  const RCouponCode({super.key});


  @override
  Widget build(BuildContext context) {
    final isDarkMode = RHelperFunctions.isDarkMode(context);
    return RRoundedContainer(
      showBorder: true,
      backgroundColor: isDarkMode ? RColors.darkerGrey : RColors.white,
      padding: const EdgeInsets.symmetric(
        vertical: RSizes.sm,
        horizontal: RSizes.md,
      ),
      child: Row(
        children: [
          // Promo Code Input
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: RSizes.spaceBtwItems),

          // Apply Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {
                // Handle coupon application logic here
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: isDarkMode
                    ? RColors.white.withOpacity(0.5)
                    : RColors.dark.withOpacity(0.85),
                backgroundColor: Colors.grey.withOpacity(0.82),
                side: BorderSide(color: Colors.grey.withOpacity(0.81)),
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
