import 'dart:async';
import 'package:click_driver_app/mainScreens/main_screen.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  // Start the timer and navigate to MainScreen after 3 seconds
  void startTimer() {
    Timer(const Duration(seconds: 300), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (c) => MainScreen()),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Adjust the logo size dynamically based on screen width
              Image.asset(
                "assets/images/click_logo.png",
                width: screenWidth * 0.6, // 60% of screen width
                height: screenHeight * 0.3, // 30% of screen height
                fit: BoxFit.contain,
              ),
              SizedBox(height: screenHeight * 0.1), // 10% vertical spacing
              // Adjust the splash image size dynamically
              Image.asset(
                "assets/images/driver_splash_image.png",
                width: screenWidth * 500, // 80% of screen width
                height: screenHeight * 0.6, // 40% of screen height
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
