import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbars/custom_appbar.dart';
import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products.cart/product_card/product_card_vertical.dart';
import '../../../../utils/constants/size.dart';
import '../home/home.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppBar(
        title: Text('Wishlist', style: Theme
            .of(context)
            .textTheme
            .headlineMedium),
        actions: [
          RCircularIcon(
              icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(RSizes.defaultSpace),
            child: Column(
                children: [
                RGridLayout(
                itemCount: 5,
                itemBuilder: (_, index) => const RProductCardVertical(),
      ),
      ],
    ),)
    ,
    )
    ,
    );
  }
}