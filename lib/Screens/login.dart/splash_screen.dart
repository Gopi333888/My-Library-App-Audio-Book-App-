import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/Screens/NavigatorBar/navigator_bar.dart';
import 'package:mylibrary/Screens/login.dart/user_login.dart';

class SplashScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

String? username;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Image.asset(
              "assets/images/Library-bro.png",
              height: 250,
              width: 250,
            ),
          ),
          const Text(
            "My Library",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      nextScreen: FirebaseAuth.instance.currentUser == null
          ? const UserLogin()
          : const NavigatorScreen(),
      splashIconSize: 500,
      duration: 2500,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
