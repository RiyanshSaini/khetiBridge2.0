import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/images/rounded_image.dart';
import '../../../../../common/widgets/appbars/custom_appbar.dart';
import '../../../../../common/widgets/custom_shapes/containers/custom_curved_edge_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/size.dart';

class RProductImageSlider extends StatelessWidget {
  const RProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;

    return RCurvedEdgeWidget(
      child: Container(
        color: dark ? RColors.darkerGrey : RColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(RSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(RImages.productImage4),
                  ),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 6,
              bottom: 30,
              left: RSizes.defaultSpace,
              child: SizedBox(
                height: 88,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: RSizes.spaceBtwItems),
                  itemBuilder: (context, index) => RRoundedImage(
                    width: 88,
                    backgroundColor: dark ? RColors.dark : RColors.white,
                    border: Border.all(color: RColors.primary),
                    padding: const EdgeInsets.all(RSizes.sm),
                    imageUrl: RImages.productImage4,
                  ),
                ),
              ),
            ),

            /// AppBar Icons
            const RAppBar(
              showBackArrow: true,
              actions: [
                RCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
