import 'package:flutter/material.dart';
import 'package:kheti_project2/common/widgets/appbars/custom_tabbar.dart';
import 'package:kheti_project2/common/widgets/layouts/grid_layout.dart';
import 'package:kheti_project2/features/shop/screens/store/widgets/categority_tab.dart';

import '../../../../common/widgets/appbars/custom_appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/custom_rounded_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container2.dart';
import '../../../../common/widgets/icons/circular_image.dart';
import '../../../../common/widgets/products.cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/brand_text_and_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helper_function.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: RAppBar(
            title: Text(
              'Store',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [
              RCartCounterIcon(
                onPressed: () {},
                iconColor: RColors.lightGreen,
              ),
            ],
          ), // RAppBar
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: RHelperFunctions.isDarkMode(context)
                      ? RColors.black
                      : RColors.white,
                  expandedHeight: 448,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(RSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: RSizes.spaceBtwItems),
                        const RSearchContainer2(
                          text: 'Search in ',
                          showBorder: true,
                          padding: EdgeInsets.zero,
                        ), // RSearchContainer
                        const SizedBox(height: RSizes.spaceBtwSections),
                        RSectionHeading(
                            title: 'Featured Brands', onPressed: () {}),
                        const SizedBox(height: RSizes.spaceBtwItems / 1.5),

                        /// --------- GRID ----------------///
                        RGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: RRoundedContainer(
                                  padding: const EdgeInsets.all(RSizes.sm),
                                  showBorder: true,
                                  backgroundColor: RColors.transparent,
                                  child: Row(
                                    children: [
                                      /// -- Icon
                                      Flexible(
                                        child: RCircularImage(
                                          isNetworkImage: false,
                                          image: RImages.tempSeed,
                                          backgroundColor: RColors.transparent,
                                          overlayColor:
                                              RHelperFunctions.isDarkMode(
                                                      context)
                                                  ? RColors.white
                                                  : RColors.black,
                                        ),
                                      ), // RCircularImage
                                      const SizedBox(
                                          width: RSizes.spaceBtwItems / 2),
                                      // ----- TEXT ---------//
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          // take min space
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const RBrandTitleWithVerifiedIcon(
                                                title: 'Seeds',
                                                brandTextSize: TextSizes.large),
                                            Text(
                                              '256 products',
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            ), // Text
                                          ],
                                        ),
                                      ) // Column
                                    ],
                                  ), // Row
                                ),
                              );
                            }) // RRoundedContainer
                      ],
                    ),
                  ),

                  // ---- TAB BAR ------------//

                  bottom: const RTabBar(
                    tabs: [
                      Tab(child: Text('Seeds & Plants')),
                      Tab(child: Text('Fertilizers')),
                      Tab(child: Text('Pesticides')),
                      Tab(child: Text('Manure')),
                      Tab(child: Text('Medicines')),
                    ],
                  ),
                ),
              ];
            },
            // ------------ BODY ------------//

            body: const TabBarView(
              children: [
                RCategoryTab(),
                RCategoryTab(),
                RCategoryTab(),
                RCategoryTab(),
                RCategoryTab(),
              ],
            ), // NestedScrollView
          ),
        )); // Scaffold
  }
}
