import 'dart:async';
import 'package:click_driver_app/on_boarding/screen1.dart';
import 'package:flutter/material.dart';
import 'package:click_driver_app/mainScreens/main_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  // Timer duration (in seconds)
  static const int splashDuration = 3;

  // Navigate to MainScreen after the timer expires
  void startTimer() {
    Timer(const Duration(seconds: splashDuration), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer(); // Start the timer when splash screen initializes
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogo(screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.1), // 10% vertical spacing
            _buildSplashImage(screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }

  // Method to build the logo widget with responsive size
  Widget _buildLogo(double screenWidth, double screenHeight) {
    return Image.asset(
      "assets/images/click_logo.png",
      width: screenWidth * 0.6, // 60% of screen width
      height: screenHeight * 0.3, // 30% of screen height
      fit: BoxFit.contain,
    );
  }

  // Method to build the splash image widget with responsive size
  Widget _buildSplashImage(double screenWidth, double screenHeight) {
    return Image.asset(
      "assets/images/driver_splash_image.png",
      width: screenWidth * 0.8, // 80% of screen width
      height: screenHeight * 0.4, // 40% of screen height
      fit: BoxFit.contain,
    );
  }
}
