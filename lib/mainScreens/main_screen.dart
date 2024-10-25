import 'package:click_driver_app/mainScreens/side_menu.dart';
import 'package:flutter/material.dart';

//hiiiiii
//abi

class MainScreen extends StatelessWidget {
  // Create a GlobalKey to control the Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen =
        screenWidth < 600; // Example threshold for small screens

    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey to Scaffold
      drawer: const SideMenu(), // Attach the side menu (drawer)
      body: Stack(
        children: [
          // Background image or map
          Image.asset(
            'assets/images/click_logo.png',
            width: MediaQuery.of(context).size.width, // Full screen width
            height: MediaQuery.of(context).size.height, // Full screen height
            fit: BoxFit.cover, // Ensures it covers the entire screen
            alignment: Alignment.center, // Keeps it centered
          ),
          // Side Menu (Hamburger) Button
          Positioned(
            top: isSmallScreen ? 30.0 : 50.0,
            left: isSmallScreen ? 10.0 : 20.0,
            child: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Container(
                padding: EdgeInsets.all(isSmallScreen ? 8.0 : 12.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
          // Search Destination Bar
          Positioned(
            top: isSmallScreen ? 80.0 : 110.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.purple,
                        size: isSmallScreen ? 20 : 24,
                      ),
                      SizedBox(width: isSmallScreen ? 8 : 10),
                      Expanded(
                        child: Text(
                          'Neemuch RD, Gopalbari, Bari Sad',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 14 : 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isSmallScreen ? 8 : 12),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.purple,
                        size: isSmallScreen ? 20 : 24,
                      ),
                      SizedBox(width: isSmallScreen ? 8 : 10),
                      Expanded(
                        child: Text(
                          'Search Destination',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 12 : 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
