import 'package:flutter/material.dart';

import '../../../features/shop/models/brand_models.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helpers/helper_function.dart';
import '../custom_shapes/containers/custom_rounded_container.dart';
import '../icons/circular_image.dart';
import '../texts/brand_text_and_icon.dart';


class RBrandCard extends StatelessWidget {
  /// Default constructor for the RBrandCard.
  ///
  /// Parameters:
  ///   - brand: The brand model to display.
  ///   - showBorder: A flag indicating whether to show a border around the card.
  ///   - onTap: Callback function when the card is tapped.
  const RBrandCard({
    super.key,
    required this.brand,
    required this.showBorder,
    this.onTap,
    this.isNetworkImage = false,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      /// Container Design
      child: RRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(RSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// -- Icon
            Flexible(
              child: RCircularImage(
                image: brand.image,
                isNetworkImage: isNetworkImage,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? RColors.white : RColors.black,
              ),
            ),
            const SizedBox(width: RSizes.spaceBtwItems / 2),

            /// -- Texts
            // [Expanded] & Column [MainAxisSize.min] is important to keep the elements in the vertical center and also
            // to keep text inside the boundaries.
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RBrandTitleWithVerifiedIcon(title: brand.name, brandTextSize: TextSizes.large),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
