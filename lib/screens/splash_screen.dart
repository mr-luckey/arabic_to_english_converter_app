import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'home_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Expanded(
            child: Center(
              child: Lottie.asset(
                'assets/images/1.json',
                animate: true,
                repeat: true,
                reverse: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
      nextScreen: const HomeLayout(),
      splashIconSize: screenWidth * 0.9, // Responsive splash size
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}
