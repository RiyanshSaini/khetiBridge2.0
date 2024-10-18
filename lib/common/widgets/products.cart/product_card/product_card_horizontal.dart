import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../../images/rounded_image.dart';
import '../../../style/shadows.dart';
import '../../custom_shapes/containers/custom_rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../texts/brand_text_and_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title.text.dart';

class RProductCardHorizontal extends StatelessWidget {
  const RProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return Container(
      width: 300,  // Fixed width for horizontal card
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [RShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(RSizes.productImageRadius),
        color: dark ? RColors.darkerGrey : RColors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,  // Ensure proper alignment
        children: [
          /// Thumbnail
          RRoundedContainer(
            height: 172,
            padding: const EdgeInsets.all(RSizes.sm),
            backgroundColor: dark ? RColors.dark : RColors.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                const SizedBox(
                  height: 128,
                  width: 128,
                  child: RRoundedImage(
                    imageUrl: RImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                /// Sale Tag
                Positioned(
                  top: 12,
                  child: RRoundedContainer(
                    radius: RSizes.sm,
                    backgroundColor: RColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: RSizes.sm,
                      vertical: RSizes.xs,
                    ),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: RColors.black),
                    ),
                  ),
                ),

                /// Favourite Icon Button
                const Positioned(
                  top: 8,
                  right: 0,
                  child: RCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: RSizes.spaceBtwItems / 2),

          /// Details
          Expanded(  // Use Expanded to avoid infinite width issues
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: RSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Product Title
                  const RProductTitleText(title: 'Green Nike', smallSize: true),
                  const SizedBox(height: RSizes.spaceBtwItems / 2),

                  /// Brand Title with Verified Icon
                  const RBrandTitleWithVerifiedIcon(title: 'Nike'),

                  const Spacer(),  // Pushes price row to the bottom

                  /// Price and Add to Cart Button Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      const RProductPriceText(price: 35),

                      /// Add to Cart Button
                      Container(
                        decoration: const BoxDecoration(
                          color: RColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(RSizes.cardRadiusMd),
                            bottomRight: Radius.circular(RSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: RSizes.iconLg * 1.2,
                          height: RSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: RColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

