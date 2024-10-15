import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../authentication/screens/widgets/onboarding.dart';



class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'.tr),
        backgroundColor: Colors.green.shade700, // Agriculture theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: [
            LanguageCard(
              languageCode: 'en',
              languageName: 'English',
              displayText: 'A',
              cardColor: Colors.lightGreen.shade300,
            ),
            LanguageCard(
              languageCode: 'hi',
              languageName: 'हिन्दी',
              displayText: 'अ',
              cardColor: Colors.brown.shade400,
            ),
            LanguageCard(
              languageCode: 'pa',
              languageName: 'ਪੰਜਾਬੀ',
              displayText: 'ੳ',
              cardColor:  Colors.orange.shade300, // Agriculture theme color
            ),
            LanguageCard(
              languageCode: 'mr',
              languageName: 'मराठी',
              displayText: 'म',
              cardColor: Colors.blue.shade200, // Agriculture theme color
            ),
            LanguageCard(
              languageCode: 'te',
              languageName: 'తెలుగు',
              displayText: 'త',
              cardColor: Colors.red.shade200, // Agriculture theme color
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageCard extends StatelessWidget {
  final String languageCode;
  final String languageName;
  final String displayText;
  final Color cardColor;

  const LanguageCard({
    super.key,
    required this.languageCode,
    required this.languageName,
    required this.displayText,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Save the selected language to GetStorage
        var locale = Locale(languageCode);
        GetStorage().write('selectedLanguage', languageCode); // Store language selection
        Get.updateLocale(locale);  // Update the app's locale immediately

        // Navigate to the next screen
        Get.to(() => const OnBoardingScreen());
      },
      child: Card(
        color: cardColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Large display text (could be an icon or a big character)
            Text(
              displayText,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            // Smaller language name text
            Text(
              languageName,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



