import 'package:flutter/material.dart';
import 'phone singin page.dart';
import 'singup_otp.dart';
import 'location_name.dart';
import 'Home.dart';
import 'tranding tour.dart';
import 'ready to go.dart';
import 'hotoffer.dart';
import 'popluar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PTSans'),
      home: SignInScreen(),
    );
  }
}

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Sign in to start\nplanning your trip',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Terms and Privacy
              const Text(
                'By proceeding you, you agree to our '
                'Terms of Use \nand confirm you read our Privacy and Cookie \nStatement.',
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),

              const SizedBox(height: 30),
              SocialButton(
                imagePath: 'images/google.png',
                text: 'Continue with Google',
                onPressed: () {
                  // Google sign-in logic
                },
              ),
              const SizedBox(height: 20),
              SocialButton(
                imagePath: 'images/facebook.png',
                text: 'Continue with Facebook',
                onPressed: () {
                  // Facebook sign-in logic
                },
              ),
              const SizedBox(height: 20),
              SocialButton(
                text: "Continue with Phone",
                imagePath: "images/phone.png",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhoneSignInScreen()));
                },
              ),

              const SizedBox(height: 20),

              // Skip & Explore Button
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homepage()));
                  },
                  child: const Text(
                    'Skip & Explore Now',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;

  const SocialButton({
    required this.imagePath,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Image.asset(imagePath, height: 24),
            ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
