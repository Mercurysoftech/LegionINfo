import 'package:flutter/material.dart';
import 'package:ohs_app/screens/forgotpasswordpage.dart';
import 'package:ohs_app/screens/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Variable to control the visibility of the password
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo Image (Top of the page)
                Image.asset(
                  'assets/App Logo.png',  // Your logo asset here
                  height: 50,
                ),
                SizedBox(height: 20),

                // "Sign In" Text
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF045D61),
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 10),

                // "Please sign in to your registered account" Text
                Text(
                  'Please sign in to your registered account',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 25),

                // Email TextField with User Icon
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "UserId",
                    prefixIcon: IconButton(
                      icon: Image.asset(
                        'assets/User Icon.png',
                        height: 22,
                        width: 22,
                      ),
                      onPressed: () {
                        // Add your mic button functionality here
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 16),

                // Password TextField with visibility toggle
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible, // Toggle the visibility
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: IconButton(
                      icon: Image.asset(
                        'assets/Lock Icon.png',
                        height: 22,
                        width: 22,
                      ),
                      onPressed: () {
                        // Add your mic button functionality here
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 30),

                // Sign In Button
                ElevatedButton(
                  onPressed: () {
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    // Handle sign in logic here (authentication)
                    print('Signing in with Email: $email, Password: $password');

                    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),  // Navigate to HomePage
    );
        
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF045D61),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Forgot Password? and Reset Here Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forgot Your Password?',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle reset password navigation here
                        print('Reset password');
                        Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordPage()),  // Navigate to HomePage
    );
                        
                      },
                      child: Text(
                        'Reset here',
                        style: TextStyle(color: Color(0xFF045D61), fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 50),

                // Terms and Privacy Policy Text
                Text(
                  'By Continuing, you agree to Legion Info\'s Terms of Use. ',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                ),

                // Privacy Policy Link
                GestureDetector(
                  child: Text(
                    'Read our Privacy Policy.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF045D61),
                      fontFamily: 'Poppins',
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
