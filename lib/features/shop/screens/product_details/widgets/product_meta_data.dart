import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/custom_rounded_container.dart';
import '../../../../../common/widgets/icons/circular_image.dart';
import '../../../../../common/widgets/texts/brand_text_and_icon.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title.text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helper_function.dart';

class RProductMetaData extends StatelessWidget {
  const RProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = RHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & Sale Price Row
        Row(
          children: [
            // Sale Tag
            RRoundedContainer(
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
            const SizedBox(width: RSizes.spaceBtwItems),
            // Original Price with strikethrough
            Text(
              '\$258',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: RSizes.spaceBtwItems),
            // Sale Price
            const RProductPriceText(price: 175, isLarge: true),
          ],
        ),
        const SizedBox(height: RSizes.spaceBtwItems / 1.5),
        // Product Title
        const RProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(height: RSizes.spaceBtwItems / 1.5),
        // Stock Status Row
        Row(
          children: [
            const RProductTitleText(title: 'Status'),
            const SizedBox(width: RSizes.spaceBtwItems),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: RSizes.spaceBtwItems / 1.5),
        // Brand Information Row
        Row(
          children: [
            RCircularImage(
              image: RImages.tempSeed,
              width: 32,
              height: 32,
              overlayColor: darkMode ? RColors.white : RColors.black,
            ),
            const SizedBox(width: RSizes.spaceBtwItems),
            const RBrandTitleWithVerifiedIcon(
              title: 'KB',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}

