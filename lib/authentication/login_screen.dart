import 'package:flutter/material.dart';
import 'sign_up_screen.dart'; // Import your Sign Up screen here

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var padding = MediaQuery.of(context).padding;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                  height: padding.top + screenHeight * 0.08), // Top padding

              // Logo (For now it's a Text widget; you can replace it with Image.asset if you have a logo image)
              Center(
                child: Image.asset(
                  'assets/images/click_logo.png', // Replace this with the path to your logo
                  height: screenHeight * 0.15, // Adjust based on screen height
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(
                  height: screenHeight *
                      0.05), // Space between logo and login title

              // Login Title
              Text(
                "Login",
                style: TextStyle(
                  fontSize: screenHeight * 0.04, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                  height: screenHeight * 0.02), // Spacing below "Login" title

              // Subtitle
              Text(
                "Login with your phone number",
                style: TextStyle(
                  fontSize: screenHeight * 0.02, // Responsive subtitle size
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                  height: screenHeight *
                      0.03), // Space between text and input field

              // Phone Number Input Field
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical:
                        screenHeight * 0.02, // Padding for responsive height
                    horizontal: 16,
                  ),
                ),
              ),

              SizedBox(
                  height: screenHeight *
                      0.03), // Space between input field and button

              // Send Code Button
              SizedBox(
                width: screenWidth, // Make the button take full width
                height:
                    screenHeight * 0.07, // Adjust height based on screen size
                child: ElevatedButton(
                  onPressed: () {
                    // Add OTP sending logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xFF7A2048), // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded edges
                    ),
                  ),
                  child: Text(
                    'Send Code',
                    style: TextStyle(
                      fontSize: screenHeight * 0.02, // Button text size
                    ),
                  ),
                ),
              ),

              SizedBox(
                  height: screenHeight *
                      0.03), // Space between button and sign-up text

              // Sign Up Navigation Text
              GestureDetector(
                onTap: () {
                  // Navigate to Sign Up screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                child: Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: screenHeight * 0.02, // Responsive font size
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: screenHeight * 0.05), // Bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}
