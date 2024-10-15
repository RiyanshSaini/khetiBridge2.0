import 'package:flutter/material.dart';
import 'package:kheti_project2/features/personalization/screens/profile/widgets/profile_menu.dart';

import '../../../../common/widgets/appbars/custom_appbar.dart';
import '../../../../common/widgets/icons/circular_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const RCircularImage(
                      image: RImages.userGif2,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: RSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: RSizes.spaceBtwItems),

              /// Profile Information Section
              const RSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              RProfileMenu(
                title: 'Name',
                value: 'Kheti Bridge',
                onPressed: () {},
              ),
              RProfileMenu(
                title: 'Username',
                value: 'Riyansh Saini',
                onPressed: () {},
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: RSizes.spaceBtwItems),

              /// Personal Information Section
              const RSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              RProfileMenu(
                title: 'User ID',
                value: '70910',
                onPressed: () {},
              ),
              RProfileMenu(
                title: 'E-mail',
                value: 'khetiBridge@support.com',
                onPressed: () {},
              ),
              RProfileMenu(
                title: 'Phone Number',
                value: '+91-8923357707',
                onPressed: () {},
              ),
              RProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              RProfileMenu(
                title: 'Date of Birth',
                value: '15-Jan-2004',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: RSizes.spaceBtwItems),

              /// Close Account Button
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
