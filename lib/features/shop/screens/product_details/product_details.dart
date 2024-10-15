import 'package:flutter/material.dart';
import 'package:kheti_project2/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:kheti_project2/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:kheti_project2/features/shop/screens/product_details/widgets/rating_and_share.dart';

import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helper_function.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = RHelperFunctions.isDarkMode(context); // Assuming this checks for dark mode

    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Product Image Slider
            const RProductImageSlider(),

            // 2. Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: RSizes.defaultSpace,
                left: RSizes.defaultSpace,
                bottom: RSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // Rating & Share Button
                  RRatingAndShare(),

                  // Price, Title, Stock, & Brand
                  RProductMetaData(),

                  // Additional Sections (Placeholders)
                  // Attributes
                  // Checkout Button
                  // Description
                  // Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
