import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbars/custom_appbar.dart';
import '../../../../common/widgets/brands/brand_cart.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/size.dart';
import '../../models/brand_models.dart';
import 'brand_products.dart'; // Ensure GetX is imported.

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BrandModel brandModel = BrandModel(name: 'KB', image: RImages.tempSeed);

    return Scaffold(
      /// AppBar
      appBar: const RAppBar(
        title: Text("Brand"),
        showBackArrow: true,
      ),

      /// Body with Scrollable Brands List
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              /// Section Heading
              const RSectionHeading(
                title: "Brands",
                showActionButton: false,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),

              /// Grid Layout for Brands
              RGridLayout(
                itemCount: 18,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => RBrandCard(
                  brand: brandModel,
                  showBorder: true,
                  onTap: () => Get.to(() => BrandProducts(brandModel: brandModel)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
