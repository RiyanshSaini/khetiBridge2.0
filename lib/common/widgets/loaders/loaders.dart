import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
// Ensure you have the icons package imported or replace with other icons
// Import your color definitions

 // Replace with appropriate icon package if needed

import '../../../utils/helpers/helper_function.dart'; // Import helper functions if needed for dark mode

class RLoaders {
  /// Hides the currently displayed SnackBar.
  static void hideSnackBar() {
    ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
  }

  /// Displays a custom toast message using SnackBar with custom styling.
  static void customToast({required String message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: RHelperFunctions.isDarkMode(Get.context!)
                ? RColors.darkerGrey.withOpacity(0.9)
                : RColors.grey.withOpacity(0.9),
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(Get.context!).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }

  /// Shows a success SnackBar with a custom title, message, and optional duration.
  static void successSnackBar({
    required String title,
    required String message,
    int duration = 3,
  }) {

    // if (title.isEmpty || message.isEmpty) {
    //   print("Empty title or message passed to snackbar");  // Debugging print statement
    // }
    //
    // print("Snackbar Title: $title");
    // print("Snackbar Message: $message");


    Get.snackbar(
      "",  // Leave this empty since we use titleText and messageText
      "",
      titleText: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      backgroundColor: Colors.green.shade600,  // Use a fresh green color for success
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(18),
      borderRadius: 10,  // Add rounded corners to the snackbar for a softer look
      icon: const Icon(Icons.eco, color: Colors.white),  // 'eco' icon for nature/agriculture
      overlayColor: Colors.green.shade100.withOpacity(0.3),  // Optional light green overlay for a soothing effect
      overlayBlur: 2,  // Slight blur to the overlay to make it soft
      barBlur: 5,  // Slight blur to the snackbar background for a modern look
    );
  }

  /// Shows an error SnackBar with a custom title and message.
  static void errorSnackBar({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      "",  // Leave this empty since we use titleText and messageText
      "",
      titleText: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      backgroundColor: Colors.green.shade700,  // Green color representing nature and success
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(18),
      icon: const Icon(Icons.eco, color: Colors.white),  // Using 'eco' icon to represent agriculture
    );
  }

  /// Shows a warning SnackBar with a custom title and message.
  static void warningSnackBar({
    required String title,
    required String message,
    int duration = 3,
  }) {
    Get.snackbar(
      "",  // Leave this empty since we use titleText and messageText
      "",
      titleText: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      backgroundColor: Colors.orange.shade700,  // Use a strong orange color for warnings
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(18),
      borderRadius: 10,  // Add rounded corners for consistency
      icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),  // Standard warning icon, with a bold color
      overlayColor: Colors.orange.shade100.withOpacity(0.3),  // Optional soft overlay
      overlayBlur: 2,  // Slight blur for the overlay
      barBlur: 5,  // Add a blur effect to the snackbar background
    );
  }
}



