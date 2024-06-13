import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:newapp/login_si/login.dart';
import 'package:lottie/lottie.dart';

class splash extends StatelessWidget {
  const splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1200,
      backgroundColor: const Color.fromARGB(255, 1, 60, 64),
      splash: SizedBox(
        height: 500,
        width: 500,
        child: LottieBuilder.asset(
          'image/classhelper.json',
          fit: BoxFit.cover,
        ),
      ),
      nextScreen: const Login(),
    );
  }
}
