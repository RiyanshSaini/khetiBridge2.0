import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kheti_project2/features/personalization/screens/address/addresses.dart';

import '../../../../common/widgets/appbars/custom_appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            RPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  RAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: RColors.white),
                    ),
                  ),
                  /// --------- User Profile Card ------------//
                  RUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen()),),
                  const SizedBox(height: RSizes.spaceBtwSections),
                ],
              ),
            ),

            //------------Body Part -----------------//

            Padding(
              padding: const EdgeInsets.all(RSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Settings Section
                  const RSectionHeading(title: "Account Settings", showActionButton: false),
                  const SizedBox(height: RSizes.spaceBtwSections),

                  RSettingsMenuTile(
                    icon: Iconsax.home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  const RSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout',
                  ),
                  const RSettingsMenuTile(
                    icon: Iconsax.box_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders',
                  ),
                  const RSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                  ),
                  const RSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all the discounted coupons',
                  ),
                  const RSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification message',
                  ),
                  const RSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                  ),

                  const SizedBox(height: RSizes.spaceBtwSections),

                  /// App Settings Section
                  const RSectionHeading(title: "App Settings", showActionButton: false),
                  const SizedBox(height: RSizes.spaceBtwItems),

                  const RSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload data to your Cloud Firebase',
                  ),
                  RSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  RSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  RSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  /// Logout Button
                  const SizedBox(height: RSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(height: RSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ], // Column children
        ),
      ),
    );
  }
}
