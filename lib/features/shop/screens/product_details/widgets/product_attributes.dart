import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chips.dart';
import '../../../../../common/widgets/custom_shapes/containers/custom_rounded_container.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title.text.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helper_function.dart';

class RProductAttributes extends StatelessWidget {
  const RProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = RHelperFunctions.isDarkMode(context); // Dark mode check

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Rounded container for "Variation", "Price", "Stock", and Description
        RRoundedContainer(
          padding: const EdgeInsets.all(RSizes.md),
          backgroundColor: darkMode ? RColors.greenShade100 : RColors.greenShade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Variation, Price and Stock Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side: Variation title
                  const RProductTitleText(
                    title: 'Variation :',
                    smallSize: false,
                  ),
                  // Right side: Price and Stock info
                  Row(
                    children: [
                      // Original Price (Strikethrough)
                      Text(
                        '\₹25',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(decoration: TextDecoration.lineThrough),
                      ),
                      const SizedBox(width: RSizes.spaceBtwItems / 2),
                      // Sale Price
                      const RProductPriceText(price: 20),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: RSizes.spaceBtwItems / 2),
              // Stock Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const RProductTitleText(
                    title: 'Stock:',
                    smallSize: false,
                  ),
                  Text(
                    'In Stock',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              // Product Description
              const RProductTitleText(
                title:
                'This is the Description of the Product and it can go up to max 4 lines.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: RSizes.spaceBtwItems),

        // Colors Section
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RSectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(height: RSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8.0,
              children: [
                // Color Chips
                RChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (value){},
                ),
                RChoiceChip(
                  text: 'Red',
                  selected: false,
                ),
                RChoiceChip(
                  text: 'Blue',
                  selected: false,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: RSizes.spaceBtwItems),

        // Size Section
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RSectionHeading(
              title: 'Size',
              showActionButton: false,
            ),
            const SizedBox(height: RSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8.0,
              children: [
                // Size Chips
                RChoiceChip(text: "EU 34", selected: true,),
                RChoiceChip(text: 'EU 36', selected: false,),
                RChoiceChip(text: 'EU 38', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
