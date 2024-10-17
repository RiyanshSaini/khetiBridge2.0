import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kheti_project2/features/personalization/screens/settings/settings.dart';
import 'package:kheti_project2/features/shop/screens/store/store.dart';
import 'package:kheti_project2/features/shop/screens/wishlist/wishlist.dart';
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
          backgroundColor: darkMode ? RColors.darkGrey : RColors.greenShade100,
          indicatorColor: darkMode
              ? Colors.green[200]?.withOpacity(0.2)
              : Colors.green[700]?.withOpacity(0.1),
          destinations: [
            NavigationDestination(icon: const Icon(Iconsax.home), label: 'home'.tr),
            NavigationDestination(icon: const Icon(Iconsax.shop), label: 'store'.tr),
            NavigationDestination(icon: const Icon(Iconsax.heart), label: 'wishlist'.tr),
            NavigationDestination(icon: const Icon(Iconsax.user), label: 'profile'.tr),
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
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen(), // Store screen
     // Profile screen
  ];
}
