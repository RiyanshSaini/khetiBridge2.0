import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products.cart/product_card/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/size.dart';
import '../../all_products/all_products.dart';

class RCategoryTab extends StatelessWidget {
  const RCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
              children: [
          // Brands
          const RBrandShowcase(
          images: [
          RImages.productImage3,
              RImages.productImage2,
              RImages.productImage1,
              ]),
          const SizedBox(height: RSizes.spaceBtwItems),
          // Products
          RSectionHeading(title: 'You might like',
            onPressed: () => Get.to(() => const AllProducts())),
            const SizedBox(height: RSizes.spaceBtwItems),
            RGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const RProductCardVertical()),
            const SizedBox(height: RSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}