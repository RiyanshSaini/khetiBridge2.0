import 'package:flutter/material.dart';
import 'package:kheti_project2/utils/helpers/helper_function.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';

class RCircularIcon extends StatelessWidget {
  const RCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = RSizes.iconLg,
    this.icon = Icons.favorite_border,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : RHelperFunctions.isDarkMode(context)
                ? RColors.black.withOpacity(0.9)
                : RColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
