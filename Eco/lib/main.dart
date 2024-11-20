import 'package:flutter/material.dart';
import 'package:onboardingscreens/splashScreens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'EcoAI Onboarding',
      home: Splashscreens(),
    );
  }
}
