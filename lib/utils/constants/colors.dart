import 'package:flutter/material.dart';

class RColors {
  RColors._(); // To avoid creating instances

  // App Basic Colors
  static const Color primary = Color(0xFF4b68ff);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Linear Gradient
  static const Gradient backgroundGradient = LinearGradient(
    colors: [
      Color(0xFF5B6A68), // Light greenish
      Color(0xFF435351), // Dark grayish
      // Add as many colors as needed
    ],
    begin: Alignment.topRight, // Start from top-right
    end: Alignment.bottomLeft, // End at bottom-left
  );

  static const Gradient homeScreenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      RColors.forestGreen,
      RColors.lightGreen,
    ],
  );

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = RColors.textWhite.withOpacity(0.1);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary =
      Color(0xFF6C7570); // Adjusted typo in hex code
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D909);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C); // Fixed 'success Color'
  static const Color warning = Color(0xFFF57C80); // Adjusted typo in hex code
  static const Color info = Color(0xFF197602);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color grey = Color(0x00808080);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color white = Colors.white;

  // Green Shades :
  static const Color tempGreen = Color(0xff19be3a);
  static const Color mintGreen = Color(0xFF98FB98);
  static const Color emeraldGreen = Color(0xFF50C878);
  static const Color oliveGreen = Color(0xFF556B2F);
  static const Color forestGreen = Color(0xFF228B22);
  static const Color lightGreen = Color(0xFF90EE90);
  static  Color darkGreen = Colors.green.shade800;
  static Color greenShade100 = Colors.green.shade100;

  static Color gold1 = const Color(0xffd5b306);
  static Color gold2 = const Color(0x00ffd700);

  static Color transparent = Colors.transparent;


}
