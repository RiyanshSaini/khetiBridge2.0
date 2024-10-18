import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kheti_project2/common/widgets/products.cart/product_card/product_card_vertical.dart';

import '../../utils/constants/size.dart';
import 'layouts/grid_layout.dart';

class RSortableProducts extends StatelessWidget {
  const RSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: RSizes.spaceBtwSections),

        /// Products
        RGridLayout(
          itemCount: 8,
          itemBuilder: (_, index) => const RProductCardVertical(),
        ),
      ],
    );
  }
}