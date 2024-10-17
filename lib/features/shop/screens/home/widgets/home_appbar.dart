import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbars/custom_appbar.dart';
import '../../../../../common/widgets/products.cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';

class RHomeAppBar extends StatelessWidget {
  const RHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RAppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Wrapping the image in a SizedBox to avoid overflow issues
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(
              "assets/icons/tractor.png",
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome to the Farm!",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: RColors.darkGreen,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "Cultivating new ideas.",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: RColors.lightGreen.withOpacity(0.8),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        // Shopping bag icon with a farming-related color theme
        RCartCounterIcon(
          iconColor: Colors.yellow.shade700,
          onPressed: () {},       // no need on onPressed , path already defined.
        ),
        const SizedBox(width: 8),
        // Icon for adding crops or eco-related actions
        IconButton(
          onPressed: () {
            // Define the action for adding crops
          },
          icon: Icon(
            Icons.eco_rounded,
            color: RColors.darkGreen,
            size: 28,
          ),
        ),
        const SizedBox(width: 8), // Padding for better spacing
      ],
    );
  }

}
