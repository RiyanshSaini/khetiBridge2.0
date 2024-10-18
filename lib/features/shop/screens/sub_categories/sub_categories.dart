import 'package:flutter/material.dart';

import '../../../../common/images/rounded_image.dart';
import '../../../../common/widgets/appbars/custom_appbar.dart';
import '../../../../common/widgets/products.cart/product_card/product_card_horizontal.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/size.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RAppBar(
        title: Text('Title Dena ha'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              const RRoundedImage(
                width: double.infinity,
                imageUrl: RImages.promoBanner1,
                applyImageRadius: true,
              ),
              const SizedBox(height: RSizes.spaceBtwSections),

              // Sub-Categories
              Column(
                children: [
                  // Heading
                  RSectionHeading(
                    title: 'Iska Design Samaj nahi Aa raha 😅',
                    onPressed: () {},
                  ),
                  const SizedBox(height: RSizes.spaceBtwItems / 2),

                  // List of Sub-Categories (Horizontal ListView with fixed height)
                  SizedBox(
                    height: 150,  // Set fixed height for the horizontal ListView
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                      const SizedBox(width: RSizes.spaceBtwItems),
                      itemBuilder: (context, index) =>
                      const RProductCardHorizontal(),
                    ), // ListView.separated
                  ), // SizedBox
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
