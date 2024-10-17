import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kheti_project2/features/shop/screens/cart/cart.dart';

import '../../../utils/constants/colors.dart';

class RCartCounterIcon extends StatelessWidget {
  const RCartCounterIcon({
    super.key, required this.iconColor , required this.onPressed,
  });

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
            size: 28,
          ),
        ),
        Positioned(
          right: -2,
          top: -2,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: RColors.lightGreen, // Badge color
              shape: BoxShape.circle,
              border: Border.all(
                color: RColors.lightGreen,
                // Subtle border for better look
                width: 1.5,
              ),
            ),
            child: Center(
              child: Text(
                "2",
                style: Theme
                    .of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(
                  color: RColors.light,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}