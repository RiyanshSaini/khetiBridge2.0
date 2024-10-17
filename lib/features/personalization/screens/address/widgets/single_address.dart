import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/custom_rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helper_function.dart';



class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    required this.selectedAddress,
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: selectedAddress ? Colors.green[100] : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: selectedAddress ? Colors.green : Colors.grey[400]!,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Tick Icon (if selected)
          if (selectedAddress)
            Positioned(
              right: 5,
              top: 8,
              child: Icon(
                Icons.check_circle,
                color: Colors.green[700],
                size: 28,
              ),
            ),

          // Address Details
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Name
              Row(
                children: [
                  Icon(Icons.person, color: Colors.green),
                  SizedBox(width: 8),
                  Text(
                    'Riyansh Saini',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              // Contact Number
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.green),
                  SizedBox(width: 8),
                  Text(
                    '(+123) 456 7898',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 8),

              // Address
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Gate - 4, Chandigarh University, Mohali, Punjab',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SingleAddress2 extends StatelessWidget {
  const SingleAddress2({
    super.key,
    required this.selectedAddress,
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final bool dark = RHelperFunctions.isDarkMode(context);

    return RRoundedContainer(
      padding: const EdgeInsets.all(15.0),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? RColors.greenShade100
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
          ? RColors.darkerGrey
          : RColors.grey,
      margin: const EdgeInsets.only(bottom: RSizes.spaceBtwItems),
      child: Stack(
        children: [
          // Tick Icon (if selected)
          if (selectedAddress)
            Positioned(
              right: 5,
              top: 8,
              child: Icon(
                Iconsax.tick_circle,
                color: dark ? RColors.light : RColors.dark,
              ),
            ),

          // Address Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Name
              Text(
                'Riyansh Saini', // Changed name to match the theme
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: RSizes.sm / 2),

              // Contact Number
              const Text(
                '(+123) 456 7898', // Sample number
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: RSizes.sm / 2),

              // Address
              const Text(
                'Gate - 4 , Chandigarh University , Mohali , Punjab',
                softWrap: true, // A farm-themed address
              ),
            ],
          ),
        ],
      ),
    );
  }
}
