import 'package:click_driver_app/authentication/Otp_screen.dart';
import 'package:click_driver_app/authentication/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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

              // Logo
              Center(
                child: Image.asset(
                  'assets/images/click_logo.png', // Replace this with your logo path
                  height: screenHeight * 0.15, // Adjust based on screen height
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(
                  height: screenHeight *
                      0.05), // Space between logo and sign up title

              // Sign Up Title
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: screenHeight * 0.04, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: screenHeight * 0.03), // Spacing below title

              // Full Name Input Field
              TextField(
                controller: fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical:
                        screenHeight * 0.02, // Adjust padding based on height
                    horizontal: 16,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02), // Space between fields

              // Email Input Field
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical:
                        screenHeight * 0.02, // Adjust padding based on height
                    horizontal: 16,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02), // Space between fields

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
                        screenHeight * 0.02, // Adjust padding based on height
                    horizontal: 16,
                  ),
                ),
              ),

              SizedBox(
                  height: screenHeight * 0.03), // Space before Sign Up button

              // Sign Up Button
              SizedBox(
                width: screenWidth, // Full width button
                height:
                    screenHeight * 0.07, // Adjust height based on screen size
                child: ElevatedButton(
                  onPressed: () {
                    // Add sign-up logic here
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xFF7A2048), // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded edges
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: screenHeight * 0.02, // Button text size
                    ),
                  ),
                ),
              ),

              SizedBox(
                  height:
                      screenHeight * 0.03), // Space before Sign In navigation

              // Already have an account? Sign In
              GestureDetector(
                onTap: () {
                  {
                    // Navigate to Sign In screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  "Already have an account? Sign In",
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
