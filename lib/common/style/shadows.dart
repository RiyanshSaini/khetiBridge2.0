import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';


class RShadowStyle {
  static final BoxShadow verticalProductShadow = BoxShadow(
    color: RColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final BoxShadow horizontalProductShadow = BoxShadow(
    color: RColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(2, 0), // Adjusted for horizontal shadow
  );
}
