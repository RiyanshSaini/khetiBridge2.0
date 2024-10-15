import 'package:flutter/material.dart';
import 'package:kheti_project2/common/widgets/products.cart/product_card/product_card_vertical.dart';
import 'package:kheti_project2/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:kheti_project2/features/shop/screens/home/widgets/home_categories.dart';
import 'package:kheti_project2/features/shop/screens/home/widgets/promo_slider.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Enhanced RAppBar with agriculture theme
                  RHomeAppBar(),
                  SizedBox(
                    height: RSizes.spaceBtwSections,
                  ),

                  // SEARch BAR
                  RSearchContainer(
                    text: "Search here",
                  ),
                  SizedBox(
                    height: RSizes.spaceBtwSections,
                  ),

                  // Categories
                  // Optional separator for better visual flow

                  // ------------ HEADINGS ---------------
                  Padding(
                    padding: EdgeInsets.only(left: RSizes.defaultSpace),
                    child: Column(
                      children: [
                        RSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: RSizes.spaceBtwItems,
                        ),
                        // ------------- CATEGORIES -------------

                        RHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),

            // -------------Body Part ----------------------//
            Padding(
                padding: const EdgeInsets.all(RSizes.defaultSpace),
                child: Column(
                  children: [
                    // ---------- PROMO SLIDER ----------------//
                    const RPromoSlider(
                      banners: [
                        RImages.promoBanner1,
                        RImages.promoBanner2,
                        RImages.promoBanner3
                      ],
                    ),

                    // --------- POPULAR PRODUCTS.----------------//
                    const SizedBox(
                      height: RSizes.spaceBtwItems,
                    ),
                    RGridLayout(
                        itemCount: 5,
                        itemBuilder: (_, index) => const RProductCardVertical())
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
