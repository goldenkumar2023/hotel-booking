import 'dart:async';

import 'package:flutter/material.dart';

import '../../../Controllers/auth_controller.dart';
import '../auth/login_screen.dart';
import '../auth/signup_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();

    Timer(const Duration(seconds: 3), () {
      authController.isLoggedIn().then((loggedIn) {
        if (loggedIn) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegisterUserScreen()));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
        }
      });
    });

    return Scaffold(
      backgroundColor: Colors
          .blueAccent, // Replace with your desired background color or gradient
      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          'hotel image.jpg',
          fit: BoxFit.cover,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'hotel logo.jpg'), // Replace with your app's logo
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                'Your App Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
