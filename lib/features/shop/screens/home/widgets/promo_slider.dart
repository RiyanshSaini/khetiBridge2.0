import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/images/rounded_image.dart';
import '../../../../../common/widgets/custom_shapes/containers/custom_circular_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/size.dart';
import '../../../controllers/home_controller.dart';

class RPromoSlider extends StatelessWidget {
  const RPromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController()); // Instantiate the controller
    final carouselController = CarouselController(); // Carousel controller

    return Column(
      children: [
        // Carousel Slider
        CarouselSlider(
          // carouselController: carouselController,
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.20, // Adjust height
            viewportFraction: 0.8, // Show part of adjacent items
            enlargeCenterPage: true, // Optional: Enlarges the center image
            onPageChanged: (index, _) =>
                controller.updatePageIndicator(index), // Track page changes
          ),
          items: banners.map((url)=> RRoundedImage(
            imageUrl: RImages.promoBanner1,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.20,
          )).toList(),
        ),
        const SizedBox(height : RSizes.spaceBtwItems), // Space between slider and dots

        // Dots Indicator using TCircularContainer
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              banners.length, // Number of carousel items
              (i) => RCircularContainer(
                width: 20,
                height: 4,
                margin: const EdgeInsets.only(right: 10),
                backgroundColor: controller.carousalCurrentIndex.value == i
                    ? RColors.lightGreen
                    : RColors.darkGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
