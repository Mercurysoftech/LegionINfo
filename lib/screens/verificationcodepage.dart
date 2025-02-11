import 'package:flutter/material.dart';
import 'package:ohs_app/screens/createnewpasswordpage.dart';
import 'dart:async';

import 'package:ohs_app/screens/homepage.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  int _remainingTime = 60; // Start with 1 minute
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  // Start the countdown timer
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer.cancel(); // Stop the timer once it reaches 0
      }
    });
  }

  // Handle Resend OTP action when time is over
  void _resendOtp() {
    setState(() {
      _remainingTime = 60; // Reset the time to 60 seconds
    });
    _startTimer(); // Start the timer again
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Image (Top of the page)
                Image.asset(
                  'assets/App Logo.png',  // Your logo asset here
                  height: 50,
                ),
            const SizedBox(height: 25),
            const Text(
              'Verify Number',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Color(0xFF3E7EFF)
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Please enter the code we just to email',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'test***@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 50,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins'
                    ),
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF3E7EFF), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF3E7EFF), width: 2),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Sign Up screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateNewPasswordPage()),
                    );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3E7EFF),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'SUBMIT',
                style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _remainingTime == 0 ? _resendOtp : null, // Only allow resend if time is 0
                  child: Text(
                    'Resend OTP',
                    style: TextStyle(
                      color: _remainingTime == 0 ? Color(0xFF3E7EFF) : Colors.black54, // Change color to blue when time is over
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Text(
                  'Estimated time ${_remainingTime ~/ 60}:${_remainingTime % 60 < 10 ? '0' : ''}${_remainingTime % 60}', // Format time as MM:SS
                  style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
