import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kheti_project2/common/widgets/products.cart/product_card/product_card_vertical.dart';
import 'package:kheti_project2/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:kheti_project2/features/shop/screens/home/widgets/home_categories.dart';
import 'package:kheti_project2/features/shop/screens/home/widgets/promo_slider.dart';
import '../../../../common/images/rounded_image.dart';
import '../../../../common/widgets/custom_shapes/containers/custom_circular_container.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/image_text_widgets/vertical_text_image.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helper_function.dart';

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
                  const RHomeAppBar(),
                  const SizedBox(
                    height: RSizes.spaceBtwSections,
                  ),

                  // SEARch BAR
                  const RSearchContainer(
                    text: "Search here",
                  ),
                  const SizedBox(
                    height: RSizes.spaceBtwSections,
                  ),

                  // Categories
                  // Optional separator for better visual flow

                  // ------------ HEADINGS ---------------
                  Padding(
                    padding: const EdgeInsets.only(left: RSizes.defaultSpace),
                    child: Column(
                      children: [
                        const RSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        const SizedBox(
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
