import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kheti_project2/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:kheti_project2/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:kheti_project2/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:kheti_project2/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:kheti_project2/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:kheti_project2/features/shop/screens/product_reviews/product_review.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helper_function.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = RHelperFunctions.isDarkMode(
        context); // Assuming this checks for dark mode

    return Scaffold(
      bottomNavigationBar: const RBottomAddToCart(),
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
                  const RRatingAndShare(),

                  // Price, Title, Stock, & Brand
                  const RProductMetaData(),

                  // Additional Sections (Placeholders)
                  const RProductAttributes(),
                  const SizedBox(height: RSizes.spaceBtwSections,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: RSizes.spaceBtwSections),
                  /// ----- Description -----------//
                  const RSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: RSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a Product description for Vermicomposter by Natural Earth. There are more things to be add that i will add during the backend.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show More',
                    trimExpandedText: ' Show Less',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ), // ReadMoreText

                  /// ------ Reviews ----------//
                  const Divider(),
                  const SizedBox(height: RSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const RSectionHeading(
                        title: "Reviews (123)",
                        showActionButton: false,
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                        onPressed: () => Get.to(() =>const  ProductReviewScreen()),
                      ),
                    ],
                  ), // Row
                  const SizedBox(height: RSizes.spaceBtwSections),

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
