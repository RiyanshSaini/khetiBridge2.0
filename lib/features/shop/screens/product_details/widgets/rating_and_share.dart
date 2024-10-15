import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart'; // Assuming you're using Iconsax for icons

class RRatingAndShare extends StatelessWidget {
  const RRatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Rating Section
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24, // Assuming this is a correct size
            ),
            const SizedBox(width: 8.0), // Adjusted spacing for better layout
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '5.0', // Rating value
                    style: Theme.of(context).textTheme.bodyLarge, // Assuming bodyLarge fits the size
                  ),
                  const TextSpan(text: ' (199)'), // Number of reviews
                ],
              ),
            ),
          ],
        ),

        // Share Button
        IconButton(
          onPressed: () {
            // Define what happens when the share button is pressed
          },
          icon: const Icon(
            Icons.share,
            size: 24, // Using a shared size
          ),
        ),
      ],
    );
  }
}
