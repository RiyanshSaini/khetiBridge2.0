import 'package:flutter/material.dart';

class RBillingAddressSection extends StatelessWidget {
  const RBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section heading with "Change" button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shipping Address",
              style: Theme.of(context).textTheme.headlineSmall, // Adjust style if needed
            ),
            TextButton(
              onPressed: () {
                // Handle "Change" action
              },
              child: const Text("Change"),
            ),
          ],
        ),

        const SizedBox(height: 8.0), // TSizes.spaceBtwItems / 2

        // Name
        Text(
          'Kheti Bridge',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 8.0), // TSizes.spaceBtwItems / 2

        // Phone number row
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: 8.0), // TSizes.spaceBtwItems
            Text(
              '+91-123-456-789',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: 8.0), // TSizes.spaceBtwItems / 2

        // Address row
        Row(
          children: [
            const Icon(Icons.location_on, color: Colors.grey, size: 16), // Changed icon for better context
            const SizedBox(width: 8.0), // TSizes.spaceBtwItems
            Expanded(
              child: Text(
                'Gate - 4 , Chandigarh University , Mohali , Punjab 140413',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0), // TSizes.spaceBtwItems / 2
      ],
    );
  }
}
