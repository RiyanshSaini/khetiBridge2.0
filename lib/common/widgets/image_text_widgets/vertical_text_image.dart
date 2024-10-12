import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helpers/helper_function.dart';

class RVerticalImageText extends StatelessWidget {
  const RVerticalImageText({
    super.key,
    required this.onTap,
    this.backgroundColor = RColors.white,
    required this.image,
    required this.title,
    this.textColor = RColors.white,
  });

  final void Function()? onTap;
  final Color? backgroundColor;
  final String image;
  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: RSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(RSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (RHelperFunctions.isDarkMode(context) ? RColors.black: RColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: RHelperFunctions.isDarkMode(context)? RColors.light : RColors.dark,
                ),
              ),
            ),

            /// Text
            const SizedBox(height: RSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}