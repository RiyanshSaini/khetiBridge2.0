import 'package:get/get.dart';

class HomeController extends GetxController {
  // Singleton instance to access the controller
  static HomeController get instance => Get.find();

  // Observable variable to track the current index of the carousel
  final carousalCurrentIndex = 8.obs;

  // Method to update the current index of the carousel
  void updatePageIndicator(int index) {
    carousalCurrentIndex.value = index;
  }
}
