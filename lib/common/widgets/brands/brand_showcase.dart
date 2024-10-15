
import 'package:flutter/material.dart';
import 'package:kheti_project2/features/shop/models/brand_models.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helpers/helper_function.dart';
import '../custom_shapes/containers/custom_rounded_container.dart';
import 'brand_cart.dart';

class RBrandShowcase extends StatelessWidget {
  const RBrandShowcase({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final BrandModel brandModel = BrandModel(name: 'KB', image: RImages.promoBanner1 , productsCount: 32);
    return RRoundedContainer(
      showBorder: true,
      borderColor: RColors.darkGrey,
      backgroundColor: RColors.transparent,
      padding: const EdgeInsets.all(RSizes.md),
      margin: const EdgeInsets.only(bottom: RSizes.spaceBtwItems),
      child: Column(
        children: [
          // Brand with Products Count
          RBrandCard(showBorder: false, brand: brandModel),
          // Brand Top 3 Product Images
          Row(
              children: images
                  .map((image) =>
                  brandTopProductImageWidget(image, context))
                  .toList()),
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: RRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(RSizes.md),
      margin: const EdgeInsets.only(right: RSizes.sm),
      backgroundColor: RHelperFunctions.isDarkMode(context)
          ? RColors.darkerGrey
          : RColors.light,
      child: Image(
        fit: BoxFit.contain,
        image: AssetImage(image),
      ),
    ),
  );
}
