import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kheti_project2/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:kheti_project2/features/shop/screens/home/widgets/home_categories.dart';
import 'package:kheti_project2/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:kheti_project2/utils/helpers/helper_function.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products.cart/product_card/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';


class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // First SliverAppBar: Contains tractor icon and welcome message (collapsible)
          const SliverAppBar(
            expandedHeight: 300.0,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: RPrimaryHeaderContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RHomeAppBar(),  // Tractor icon + Welcome text
                      SizedBox(height: 16),
                      RSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                      ),
                      SizedBox(height: 10),
                      RHomeCategories(),  // Add categories directly inside this section
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Second Sliver: Search bar (pinned to the top)
          SliverPersistentHeader(
            pinned: true,
            delegate: SearchBarDelegate(
              child: RSearchContainer(
                text: "Search here",
              ),
            ),
          ),

          // Rest of the content: Categories and Products
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const RPromoSlider(
                    banners: [
                      RImages.promoBanner1,
                      RImages.promoBanner2,
                      RImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: 20),
                  RGridLayout(
                    itemCount: 5,
                    itemBuilder: (_, index) => const RProductCardVertical(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  SearchBarDelegate({required this.child});

  @override
  double get minExtent => 85.0; // Minimum height for the search bar.
  @override
  double get maxExtent => 85.0; // Maximum height for the search bar.

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double effectiveExtent = maxExtent - shrinkOffset;
    final darkMode = RHelperFunctions.isDarkMode(context);
    // Ensure the height doesn't go below the minExtent to avoid layout issues.
    effectiveExtent = effectiveExtent.clamp(minExtent, maxExtent);

    return SizedBox(
      height: effectiveExtent, // Use effective height.
      child: Padding(
        padding: const EdgeInsets.only(top : 28 , bottom : 10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), // Rounded edges.
            color: darkMode ? Colors.yellow.shade600 : Colors.green.shade100, // Background color for the search bar.
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16.0), // Side padding.
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: child, // Include the search container.
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true; // Always rebuild for consistency.
  }
}
