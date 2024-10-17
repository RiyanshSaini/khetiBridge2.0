import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/custom_rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helper_function.dart';

class RBillingPaymentSection extends StatelessWidget {
  const RBillingPaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        RSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: RSizes.spaceBtwItems / 2),
        Row(
          children: [
            RRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? RColors.light : RColors.white,
              padding: const EdgeInsets.all(RSizes.sm),
              child: const Image(
                image: AssetImage(RImages.google),
                fit: BoxFit.contain,
              ),
            ), // TRounded Container
            const SizedBox(width: RSizes.spaceBtwItems / 2),
            Text(
              'GPay',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ) // Row
      ],
    ); // Column
  }
}