import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kheti_project2/features/shop/screens/cart/cart.dart';
import 'package:kheti_project2/features/shop/screens/checkout/checkout.dart';
import 'package:kheti_project2/utils/theme/theme.dart';
import 'bindings/general_bindings.dart';
import 'features/authentication/screens/splash_screen.dart';
import 'localization/language/translation.dart';
// Assuming you have light/dark themes defined here

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Retrieve the selected language from GetStorage
//     final GetStorage storage = GetStorage();
//     String? selectedLanguage = storage.read('selectedLanguage');
//
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       themeMode: ThemeMode.system,
//       darkTheme: TAppTheme.darkTheme,
//       theme: TAppTheme.lightTheme,
//       translations: AppTranslations(),    // Add translation.
//       // Use the saved language if available, otherwise default to English
//       locale: selectedLanguage != null ? Locale(selectedLanguage) : const Locale('en'),
//
//       fallbackLocale: const Locale('en'), // Fallback if locale not found.
//       home: const SplashScreen(),  // Show SplashScreen first
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the selected language from GetStorage
    final GetStorage storage = GetStorage();
    String? selectedLanguage = storage.read('selectedLanguage');

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: RAppTheme.darkTheme,
      theme: RAppTheme.lightTheme,
      initialBinding: GeneralBindings(),
      translations: AppTranslations(),    // Add translation
      // Use the saved language if available, otherwise default to English
      locale: selectedLanguage != null ? Locale(selectedLanguage) : const Locale('en'),
      fallbackLocale: const Locale('en'), // Fallback if locale not found
      // home: const SplashScreen(),  // Show SplashScreen first
      home: const CartScreen(),

    );
  }
}



