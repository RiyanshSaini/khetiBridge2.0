import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/widgets/custom_shapes/containers/custom_rounded_container.dart';
import '../../../../../common/widgets/products.cart/ratings/rating_bar_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helper_function.dart';

class RUserReviewCard extends StatelessWidget {
  const RUserReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool dark = RHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User Information
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(RImages.userGif1), // Profile Image
                ),
                const SizedBox(width: RSizes.spaceBtwItems),
                Text(
                  'John Doe', // Sample Name
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),

        const SizedBox(height: RSizes.spaceBtwItems),

        // User Review Rating
        Row(
          children: [
            const RRatingBarIndicator(rating: 4), // Rating Bar
            const SizedBox(width: RSizes.spaceBtwItems),
            Text(
              'Nov 2023', // Review Date
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        const SizedBox(height: RSizes.spaceBtwItems),

        // Review Text with Read More functionality
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: RColors.primary,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: RColors.primary,
          ),
        ),

        const SizedBox(height: RSizes.spaceBtwItems),

        // Company Review Section
        RRoundedContainer(
          backgroundColor: dark ? RColors.darkerGrey : RColors.lightGreen, // Green for light mode
          child: Padding(
            padding: const EdgeInsets.all(RSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kheti Bridge', // Store Name
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '15 Oct , 2024', // Date
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: RSizes.spaceBtwItems),
                const ReadMoreText(
                  'This farm store offers a great variety of fresh produce and tools. The ordering process is seamless, and delivery was quick!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: RColors.primary,
                  ),
                  lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: RColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: RSizes.spaceBtwSections,),
      ],
    );
  }
}
