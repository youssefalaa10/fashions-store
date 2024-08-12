import 'package:fashions/modules/Landing/onboarding_screen.dart';
import 'package:fashions/shared/app_string.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start a 3 second timer and navigate after it expires
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the desired screen using the Navigator
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()), // Replace 'SecondScreen' with your screen widget
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
 
          image: DecorationImage(
              image: AssetImage(AppString.splash), fit: BoxFit.cover)),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    ));
  }
}
