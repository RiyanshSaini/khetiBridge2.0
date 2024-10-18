import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/custom_rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helper_function.dart';

class ROrderListItems extends StatelessWidget {
  const ROrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_,__) => const SizedBox(height : RSizes.spaceBtwItems),
      itemCount: 4,
      itemBuilder:(_ , index) => RRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(RSizes.md),
        backgroundColor: dark ? RColors.darkerGrey : RColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Row 1 - Order Status & Date
            Row(
              children: [
                /// Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: RSizes.spaceBtwItems / 2),
      
                /// Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: RColors.primary,
                          fontWeightDelta: 1,
                        ),
                      ),
                      Text(
                        '07 Nov 2024',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
      
                /// Arrow Icon Button
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.arrow_right_34, size: RSizes.iconSm),
                ),
              ],
            ),
            const SizedBox(height: RSizes.spaceBtwItems),
      
            /// Row 2 - Shipping Date
            Row(
              children: [
                /// Icon
                const Icon(Iconsax.tag),
                const SizedBox(width: RSizes.spaceBtwItems / 2),
      
                /// Shipping Date Info
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shipping Date',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        '03 Feb 2025',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
