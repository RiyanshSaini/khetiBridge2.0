import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class RCircularContainer extends StatelessWidget {
  const RCircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor = Colors.white,
    this.shadow = false, this.margin, // Optional shadow toggle
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsets? margin;
  final double padding;
  final Widget? child;
  final Color backgroundColor;
  final bool shadow; // Flag to enable shadow

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        boxShadow: shadow
            ? [
          BoxShadow(
            color: RColors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ]
            : null,
      ),
      child: child, // Optional child widget
    );
  }
}

