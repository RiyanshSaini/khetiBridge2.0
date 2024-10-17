import 'package:flutter/material.dart';

import '../../../../../common/widgets/products.cart/cart_item.dart';
import '../../../../../common/widgets/products.cart/product_quantity_add_and_remove.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/size.dart';

class RCartItems extends StatelessWidget {
  const RCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 6,
      separatorBuilder: (context, index) =>
          const SizedBox(height: RSizes.spaceBtwSections),
      itemBuilder: (context, index) => Column(
        children: [
          const RCartItem(),
          if (showAddRemoveButton)
            const SizedBox(
              height: RSizes.spaceBtwItems,
            ),
          if (showAddRemoveButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Extra Space :
                    SizedBox(
                      width: 10,
                    ),
                    RProductQuantityWithAddAndRemoveButton(
                      quantity: 4,
                    ),
                  ],
                ),
                // Price Text.
                RProductPriceText(price: 198),
              ],
            ),
        ],
      ),
    );
  }
}
