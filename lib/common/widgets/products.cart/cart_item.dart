import 'package:flutter/material.dart';
import '../../../../common/images/rounded_image.dart';
import '../../../../common/widgets/texts/brand_text_and_icon.dart';
import '../../../../common/widgets/texts/product_title.text.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helper_function.dart';


class RCartItem extends StatelessWidget {
  const RCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        RRoundedImage(
          imageUrl: RImages.productImage1,
          width: 60,
          height: 68,
          padding: const EdgeInsets.all(RSizes.sm),
          backgroundColor: RHelperFunctions.isDarkMode(context) ? RColors.darkerGrey : RColors.light,
        ), // RRounded Image
        const SizedBox(width: RSizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RBrandTitleWithVerifiedIcon(title: "KB"),
              const Flexible(
                child: RProductTitleText(
                  title: 'Don\'t know what to add',
                  maxLines: 2,
                ),
              ),
              // Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Color: ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Green', style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: '\nQuantity: ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: '500ml', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}