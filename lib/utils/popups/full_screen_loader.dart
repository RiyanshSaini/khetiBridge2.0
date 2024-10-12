import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_function.dart';

class RFullScreenLoader {
  /// Opens a full-screen loading dialog with a given text and animation.
  /// This method is used in the E-commerce app for effortless email verification and other tasks.
  ///
  /// This method doesn't return anything.
  ///
  /// Parameters:
  /// - text: The text to be displayed in the loading dialog.
  /// - animation: The animation to be shown in the loading dialog.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, // Use Get.overlayContext for overlay dialogs
      barrierDismissible: false, // Prevent dismissal by tapping outside the dialog
      builder: (BuildContext context) {
        return PopScope(
          canPop: false, // Disable back button to prevent popping
          child: Container(
            color: RHelperFunctions.isDarkMode(Get.context!)
                ? RColors.dark
                : RColors.white,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 250), // Adjust spacing as needed
                RAnimationLoaderWidget(
                  text: text,
                  animation: animation,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop(); // Close the dialog using hte Navigator.
  }

}
