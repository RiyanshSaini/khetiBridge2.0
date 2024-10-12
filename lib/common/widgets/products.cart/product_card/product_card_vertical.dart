import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kheti_project2/common/widgets/texts/product_price_text.dart';
import 'package:kheti_project2/common/widgets/texts/product_title.text.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../../images/rounded_image.dart';
import '../../../style/shadows.dart';
import '../../custom_shapes/containers/custom_rounded_container.dart';
import '../../icons/circular_icon.dart';

class RProductCardVertical extends StatelessWidget {
  const RProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context); // Detect dark mode

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 188,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: dark ? RColors.darkerGrey : RColors.mintGreen,
          borderRadius: BorderRadius.circular(RSizes.productImageRadius),
          boxShadow: [RShadowStyle.verticalProductShadow], // Shadow for card
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **Product Image with Discount and Wishlist Icons**
            RRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(RSizes.sm),
              backgroundColor: dark ? RColors.dark : RColors.light,
              child: Stack(
                children: [
                  /// **Thumbnail Image**
                  const RRoundedImage(
                    imageUrl: RImages.productImage1,
                    applyImageRadius: true,
                    fit: BoxFit.cover,
                  ),

                  /// **Discount Tag**
                  Positioned(
                    top: 0,
                    left: 0,
                    child: RRoundedContainer(
                      radius: RSizes.sm,
                      backgroundColor: RColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: RSizes.sm,
                        vertical: RSizes.xs,
                      ),
                      child: Text(
                        '25% OFF',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: RColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),

                  /// **Wishlist Icon Button**

                  const Positioned(
                      top: 0,
                      right: 0,
                      child: RCircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      )),
                ],
              ),
            ),

            const SizedBox(height: RSizes.spaceBtwItems / 2),
            // Spacing between image and title

            /// **Product Name & Details** ///
            Padding(
                padding: const EdgeInsets.only(left: RSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RProductTitleText(
                      title: 'BIO Fertilizer',
                      smallSize: true,
                    ),
                    const SizedBox(height: RSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        Text(
                          'KMB',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(width: RSizes.xs),
                        const Icon(
                          Iconsax.verify5,
                          color: RColors.primary,
                          size: RSizes.iconXs,
                        ),
                      ],
                    ),
                    const SizedBox(height: RSizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Rrice Text
                        const RProductPriceText(
                          price: 350,
                        ),
                        // Add Button Container
                        Container(
                          decoration: const BoxDecoration(
                            color: RColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(RSizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(RSizes.productImageRadius),
                            ),
                          ),
                          child: const SizedBox(
                            width: RSizes.iconLg * 1.2,
                            height: RSizes.iconLg * 1.2,
                            child: Center(
                              child: Icon(
                                Iconsax.add,
                                color: RColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
