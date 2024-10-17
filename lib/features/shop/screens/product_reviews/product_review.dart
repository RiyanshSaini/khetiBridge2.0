import 'package:flutter/material.dart';
import 'package:kheti_project2/common/widgets/appbars/custom_appbar.dart';
import 'package:kheti_project2/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:kheti_project2/features/shop/screens/product_reviews/widgets/user_review_card.dart';

import '../../../../common/widgets/products.cart/ratings/rating_bar_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RAppBar(title: Text('Reviews & Rating'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // TSizes.defaultSpace
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Description Text
              const Text(
                "Ratings and reviews are verified and are from people who use the same type of device that you use.",
                style: TextStyle(fontSize: 16), // Adjust the style as per your theme
              ),
              const SizedBox(height: 16.0), // TSizes.spaceBtwItems

              // Overall Product Rating (Add your own widget here)
              const RoverallProductRating(),

              // Rating Bar Indicator (Add your own widget here)
              const RRatingBarIndicator(rating: 3.5),

              const SizedBox(height: 16.0), // TSizes.spaceBtwSections

              // Reviews Count Text
              Text(
                "12,611", // Example count of reviews
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const SizedBox(height: 16.0), // TSizes.spaceBtwSections

              // User Reviews List (Add multiple UserReviewCard widgets)
              const RUserReviewCard(), // Example of user review card
              const RUserReviewCard(), // Another example of user review card
              const RUserReviewCard(), // Add as many as required
            ],
          ),
        ),
      ),
    );
  }
}
