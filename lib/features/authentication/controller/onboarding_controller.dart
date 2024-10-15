import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../screens/login/login.dart';

class  OnBoardingController extends GetxController {
  // Singleton instance
  static OnBoardingController get instance => Get.find();

  // Variables
  var currentPageIndex = 0.obs; // Observable index for current page
  final pageController = PageController(); // PageController for managing page navigation

  /// Update Current Index when Page Scroll
  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  /// Jump to the specific dot selected page.
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Update Current Index & jump to next page
  void nextPage() {
    if(currentPageIndex.value == 2){
      final storage = GetStorage();

      // if(kDebugMode){
      //   print('============================ GET STORAGE Next Button ==================');
      //   print(storage.read('IsFirstTime'));
      // }
      // Set IsFirstTime to false after completing onboarding
      storage.write('IsFirstTime', false);

      // Navigate to LoginScreen after onboarding
      Get.offAll(const LoginScreen());
    }else{
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & jump to the last Page
  void skipPage() {
    currentPageIndex.value = 2; // Assuming 3 onboarding screens
    pageController.jumpToPage(2);
  }

  @override
  void onClose() {
    pageController.dispose(); // Dispose of PageController when not needed
    super.onClose();
  }
}
