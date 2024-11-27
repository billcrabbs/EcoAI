import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: const Center(
        child: Text('Authentication page'),
      ),
    );
  }
}
