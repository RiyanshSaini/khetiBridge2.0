import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helper_function.dart';

class RBottomAddToCart extends StatelessWidget {
  const RBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = RHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: RSizes.defaultSpace,
        vertical: RSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? RColors.transparent : RColors.transparent, // Use green in light mode
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(RSizes.cardRadiusLg),
          topRight: Radius.circular(RSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Quantity Control
          Row(
            children: [
              RCircularIcon(
                icon: Icons.remove, // Decrease quantity
                backgroundColor: RColors.greenShade100,
                width: 48,
                height: 40,
                color: RColors.white,
              ),
              const SizedBox(width: RSizes.spaceBtwItems),
              Text(
                '2', // Sample quantity
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: RSizes.spaceBtwItems),
              RCircularIcon(
                icon: Icons.add, // Increase quantity
                backgroundColor: RColors.greenShade100,
                width: 40,
                height: 48,
                color: RColors.white,
              ),
            ],
          ),

          // Add to Cart Button
          ElevatedButton.icon(
            onPressed: () {
              // Handle add to cart logic
            },
            icon: const Icon(Icons.shopping_basket, color: Colors.white), // Basket icon
            label: const Text('Add to Basket'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(RSizes.md),
              backgroundColor: dark ? RColors.gold1 : RColors.gold1, // Earthy green tones
              side: const BorderSide(color: RColors.tempGreen),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded button shape
              ),
            ),
          ),
        ],
      ),
    );
  }
}
