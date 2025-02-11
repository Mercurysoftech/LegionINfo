import 'package:flutter/material.dart';
import 'package:ohs_app/screens/loginscreen.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateNewPasswordPageState createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Variables to manage password visibility
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

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
                SizedBox(height: 40),

                // "Create New Password" Text
                Text(
                  'Create New Password',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3E7EFF),
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 10),

                // "Fill your information below" Text
                Text(
                  'Fill your information below',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 25),

                // Password TextField with Eye Icon
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
                        // Handle your functionality for the lock icon if needed
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
                    fontFamily: 'Poppins', // Use system font like Arial or Roboto
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 25),

                // Confirm Password TextField with Eye Icon
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible, // Toggle the visibility
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    prefixIcon: IconButton(
                      icon: Image.asset(
                        'assets/Lock Icon.png',
                        height: 22,
                        width: 22,
                      ),
                      onPressed: () {
                        // Handle your functionality for the lock icon if needed
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible; // Toggle visibility
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
                    fontFamily: 'Poppins', // Use system font like Arial or Roboto
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 30),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    String password = _passwordController.text;
                    String confirmpassword = _confirmPasswordController.text;
                    // Handle your password submission logic here
                    print('Password: $password, ConfirmPassword: $confirmpassword');

                    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),  // Navigate to HomePage
    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3E7EFF), // Blue background color
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
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
