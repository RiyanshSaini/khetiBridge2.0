import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../painters/custom_wavy_painter.dart';
import 'custom_circular_container.dart';
import 'custom_curved_edge_widget.dart';

class RPrimaryHeaderContainer extends StatelessWidget {
  const RPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RCurvedEdgeWidget(
      child: Container(
        decoration: const BoxDecoration(
          gradient: RColors.homeScreenGradient,
        ),
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              // Circular highlight 1
              Positioned(
                top: -100,
                left: -150,
                child: RCircularContainer(
                  width: 350,
                  height: 350,
                  backgroundColor: RColors.light.withOpacity(0.15),
                ),
              ),
              // Circular highlight 2
              Positioned(
                top: 100,
                right: -220,
                child: RCircularContainer(
                  width: 300,
                  height: 300,
                  backgroundColor: RColors.light.withOpacity(0.2),
                ),
              ),
              // Gradient circle at the bottom
              Positioned(
                bottom: -60,
                left: 0,
                child: RCircularContainer(
                  width: 250,
                  height: 250,
                  backgroundColor: RColors.light.withOpacity(0.1),
                ),
              ),
              // Adding a farm-related icon (tractor)

              // Moving Tractor Icon in AppBar.
              // Positioned(
              //   top: 50,
              //   left: 30,
              //   child: Image.asset(
              //     "assets/icons/tractor.png",
              //     color: RColors.light.withOpacity(0.5),
              //     width: 50,
              //     height: 50,
              //   ),
              // ),
              // Wavy shape at the bottom
              Positioned(
                bottom: 0,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 80),
                  painter: RWavyPainter(),
                ),
              ),
               child, // Ensure child is only added if not null
            ],
          ),
        ),
      ),
    );
  }
}
