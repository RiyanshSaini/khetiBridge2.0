import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kheti_project2/features/shop/screens/home/home.dart';
import 'package:kheti_project2/utils/constants/colors.dart';
import 'package:kheti_project2/utils/helpers/helper_function.dart';

import 'features/shop/screens/home/home2.dart'; // Assuming you are using Iconsax

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(NavigationController()); // GetX controller instance
    final darkMode = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 88,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? Colors.green[900] : Colors.green[50],
          indicatorColor: darkMode
              ? Colors.green[200]?.withOpacity(0.2)
              : Colors.green[700]?.withOpacity(0.1),
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'home'.tr),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'store'.tr),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'wishlist'.tr),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'profile'.tr),
          ],
        ),
      ),
      body: Obx(() => controller.screens[
          controller.selectedIndex.value]), // Display the selected screen
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs; // Default selected index is set to 0

  final List<Widget> screens = [
    const HomeScreen2(), // Home screen
    const HomeScreen(), // Store screen
    Container(color: Colors.orange), // Wishlist screen
    Container(color: Colors.blue), // Profile screen
  ];
}
