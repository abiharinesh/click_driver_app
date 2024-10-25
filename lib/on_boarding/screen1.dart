import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // This function auto-scrolls through the pages every 3 seconds
  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      _pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Onboarding Pages - Position Adjustable
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: <Widget>[
                buildOnboardingPage(
                  image: 'assets/images/onbording_screen/screen_1.png',
                  title: 'Travel made easy',
                  description:
                      'Simplifying every step of your journey so you can focus on the adventure. From planning to exploring, we make travel stress-free and unforgettable.',
                ),
                buildOnboardingPage(
                  image: 'assets/images/onbording_screen/screen_2.png',
                  title: 'Tracking Realtime',
                  description:
                      'Reliable rides with live tracking at your fingertips. See your driver’s exact location and arrival time, ensuring a safe and seamless travel experience.',
                ),
                buildOnboardingPage(
                  image: 'assets/images/onbording_screen/screen_4.png',
                  title: "Don't worry your data is private",
                  description:
                      'Rest assured, your data is safe and secure. We prioritize your privacy, using advanced encryption and strict policies to protect your information at all times',
                ),
              ],
            ),
          ),

          // Bottom Navigation with Animated Dots and Button - Position Adjustable
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: buildBottomNavigation(),
          ),
        ],
      ),
    );
  }

  // This function builds each onboarding page with an image, title, and description.
  Widget buildOnboardingPage({required String image, required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.only(top:40),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Adjust padding here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Adjust alignment here
            children: <Widget>[
              // Image Section - Position Adjustable
              Image.asset(image, height: 300), // Adjust image height here
              SizedBox(height: 20), // Spacing between image and title
        
              // Title Section - Position Adjustable
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10), // Spacing between title and description
        
              // Description Section - Position Adjustable
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // This function builds the bottom navigation with animated dots and "Get Started" button.
  Widget buildBottomNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0), // Adjust padding to move bottom section
      child: Column(
        children: [
          // Animated Dots Row - Position Adjustable
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3, // Number of pages (update this if more pages are added)
              (index) => buildDot(index, context),
            ),
          ),
          SizedBox(height: 50), // Adjust gap between dots and button

          // "Get Started" Button - Position Adjustable
          ElevatedButton(
            onPressed: () {
              // Add your navigation or functionality here
            },
            child: Text('Get Started', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 98, 17, 45), // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Button padding
            ),
          ),
        ],
      ),
    );
  }

  // This function builds an individual dot indicator
  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 10,
      width: currentPage == index ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: currentPage == index ? Color.fromARGB(255, 98, 17, 45) : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
