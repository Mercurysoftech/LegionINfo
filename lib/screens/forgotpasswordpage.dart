import 'package:flutter/material.dart';
import 'package:ohs_app/screens/verificationcodepage.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();


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

                SizedBox(height: 50),

                // "Sign In" Text
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3E7EFF),
                    fontFamily: 'Poppins'
                  ),
                  textAlign: TextAlign.start,
                ),

                SizedBox(height: 10),

                // "Please sign in to your registered account" Text
                Text(
                  'Reset your account password and access your account again',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: 'Poppins'
                  ),
                  textAlign: TextAlign.start,
                ),

                SizedBox(height: 25),

                // Email TextField with User Icon
                TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: IconButton(
                        icon: Image.asset(
                          'assets/Email Icon.png',
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
                        borderSide: BorderSide(color:Colors.grey,width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color:Colors.grey,width: 1),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    style: TextStyle(
                      fontFamily: 'Poppins', // Use system font like Arial or Roboto
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    String email = _emailController.text;
                    print('Email: $email');
                    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VerificationScreen()),  // Navigate to HomePage
    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF045D61), // Blue background color
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Reduced border radius
                  ),
                  ),
                  child: Text('SUBMIT',style: TextStyle(fontFamily: 'Poppins',color: Colors.white,fontWeight: FontWeight.bold,fontSize:16 ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
