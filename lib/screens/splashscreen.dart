import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0; // Start with the logo being fully transparent

  @override
  void initState() {
    super.initState();
    
    // Start the fade-in animation after a small delay
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0; // Fade-in the logo
      });

      // Navigate to the home screen after the animation
      Future.delayed(Duration(seconds: 2), () {
        // For example, navigate to home screen
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/home');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Makes the container cover the entire screen
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Splash Screen.png'), // Your background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Centered Logo with fade-in animation
          Center(
            child: AnimatedOpacity(
              opacity: _opacity,  // Control the fade-in effect
              duration: Duration(seconds: 1),  // Duration of the fade-in effect
              child: Image.asset(
                'assets/logo.png',  // Your logo image path
                width: 150,  // Adjust width as needed
                height: 150,  // Adjust height as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
