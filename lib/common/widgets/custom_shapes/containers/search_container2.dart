import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/device/device_utils.dart';
import '../../../../utils/helpers/helper_function.dart';

class RSearchContainer2 extends StatelessWidget {
  const RSearchContainer2({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackGround = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: RSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackGround, showBorder;
  final VoidCallback? onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final darkMode = RHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: RDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(RSizes.md),
          decoration: BoxDecoration(
            color: showBackGround
                ? darkMode
                ? RColors.lightGreen
                : RColors.greenShade100
                : RColors.transparent,
            borderRadius: BorderRadius.circular(RSizes.cardRadiusLg),
            border: showBackGround ? Border.all(color: RColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: RColors.darkerGrey),
              const SizedBox(width: RSizes.spaceBtwItems),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}