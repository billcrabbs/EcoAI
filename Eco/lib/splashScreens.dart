import 'package:flutter/material.dart';
import 'package:onboardingscreens/src/features/onboarding/presentation/pages/Onboard.dart';

class Splashscreens extends StatefulWidget {
  const Splashscreens({super.key});

  @override
  State<Splashscreens> createState() => _SplashscreensState();
}

class _SplashscreensState extends State<Splashscreens> {
  @override
  void initState() {
    super.initState();
    _goHome();
  }

  Future<void> _goHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/Group 3.png"),
      ),
    );
  }
}
