import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import 'custom_circular_container.dart';
import 'custom_curved_edges.dart';


class RCurvedEdgeWidget extends StatelessWidget {
  const RCurvedEdgeWidget({super.key , this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: RCustomCurvedEdges(),
      child: child
    );
  }
}