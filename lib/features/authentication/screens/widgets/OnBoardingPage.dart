import 'package:flutter/material.dart';


import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_function.dart';
import 'OnBoardingNextButton.dart';
import 'OnBoardingPageDotNavigation.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {

    final dark = RHelperFunctions.isDarkMode(context);
    return Container(
      color: Colors.green, // Green background for the entire page
      child: Center(
        child: Stack(
          children: [
            // The Card with image and text
            SizedBox(
              height: RHelperFunctions.screenHeight() * 0.83,
              width: RHelperFunctions.screenWidth() * 0.93, // Card width adjustment
              child: Card(
                color: dark ? Colors.black54 : Colors.white,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // Rounded corners for the card
                ),
                margin: const EdgeInsets.all(24),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image with a circular container
                      Container(
                        width: RHelperFunctions.screenWidth() * 0.4, // Circle diameter
                        height: RHelperFunctions.screenWidth() * 0.4, // Same height to maintain perfect circle
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover, // Image fit
                          ),
                        ),
                      ),
                      const SizedBox(height: 16), // Space between image and text

                      // Title
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.green, // Green text for the title
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 8), // Space between title and subtitle

                      // Subtitle
                      Text(
                        subTitle,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey, // Grey subtitle color
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),


            // Boarding Dots.
            const OnBoardingDotNavigation(),

            // Boarding Next Button.
            const OnBoardingNextButtion(),
          ],
        ),
      ),
    );
  }
}



// class OnBoardingPage extends StatelessWidget {
//   const OnBoardingPage({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.subTitle,
//   });
//
//   final String image, title, subTitle;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(TSizes.defaultSpace),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image(
//             width: THelperFunctions.screenWidth() * 0.6,
//             height: THelperFunctions.screenHeight() * 0.4,
//             image: AssetImage(image),
//           ), // Image
//
//           const SizedBox(height: TSizes.spaceBtwItems), // Space between items
//
//           Text(
//             title,
//             style: Theme.of(context).textTheme.headlineLarge,
//             textAlign: TextAlign.center,
//           ), // Title
//
//           const SizedBox(height: TSizes.spaceBtwItems),
//
//           Text(
//             subTitle,
//             style: Theme.of(context).textTheme.bodyMedium,
//             textAlign: TextAlign.center,
//           ), // Subtitle
//         ],
//       ),
//     );
//   }
// }