import 'package:flutter/material.dart';
import 'package:ohs_app/screens/createnewpasswordpage.dart';
import 'package:ohs_app/screens/homepage.dart';
import 'package:ohs_app/screens/loginscreen.dart';
import 'package:ohs_app/screens/splashscreen.dart';
import 'package:ohs_app/screens/verificationcodepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => LoginPage(),
      },
    );
  }
}
