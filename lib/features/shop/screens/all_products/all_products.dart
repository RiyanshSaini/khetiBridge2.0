import 'package:flutter/material.dart';
import '../../../../common/widgets/RSortableProducts.dart';
import '../../../../common/widgets/appbars/custom_appbar.dart';
import '../../../../utils/constants/size.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: const RAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: RSortableProducts(),
        ),
      ),
    );
  }
}

