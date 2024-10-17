import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kheti_project2/features/personalization/screens/address/widgets/single_address.dart';

import '../../../../common/widgets/appbars/custom_appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import 'add_new_addresses.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: RColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: RColors.white),
      ), // FloatingActionButton
      appBar: RAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ), // TAppBar
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(selectedAddress: false),
              SingleAddress(selectedAddress: true),
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
