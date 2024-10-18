import 'package:flutter/material.dart';
import 'package:kheti_project2/features/shop/models/brand_models.dart';

import '../../../../common/widgets/RSortableProducts.dart';
import '../../../../common/widgets/appbars/custom_appbar.dart';
import '../../../../common/widgets/brands/brand_cart.dart';
import '../../../../utils/constants/size.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brandModel});

  final BrandModel brandModel;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: const RAppBar(title: Text('Title Kya Dalu?') , showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              RBrandCard(showBorder: true , brand: brandModel,),
              const SizedBox(height: RSizes.spaceBtwSections),

              /// Sortable Products
              const RSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
