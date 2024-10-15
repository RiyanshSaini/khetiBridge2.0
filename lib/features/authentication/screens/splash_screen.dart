import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kheti_project2/features/authentication/screens/otp/opt_screen.dart';
import '../../../utils/constants/colors.dart';
import '../../personalization/language/language_selection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  final GetStorage _storage = GetStorage();

  @override
  void initState() {
    super.initState();

    // Set the app to immersive mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Check if first time user and redirect accordingly
    Future.delayed(const Duration(seconds: 3), () {
      bool isFirstTime = _storage.read('IsFirstTime') ?? true;
      if (isFirstTime) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const LanguageSelectionPage(), // First-time users go to Language Selection
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const OTPScreen(), // Non-first-time users go to LoginScreen
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    // Restore the system UI overlays when leaving the screen
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RColors.backgroundGradient,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/icons/tempLogoTrans2.png"))
          ],
        ),
      ),
    );
  }
}

