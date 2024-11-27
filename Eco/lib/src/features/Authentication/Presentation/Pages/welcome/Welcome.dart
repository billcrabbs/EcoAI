import 'package:flutter/material.dart';
import '../signup/createaccount.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: WelcomeContent(),
      ),
    );
  }
}

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/Bot.png')),
            const SizedBox(height: 30),
            const Text(
              'Welcome to Eco AI',
              style: TextStyle(fontSize: 24, color: Color(0xFF4CAC3E)),
            ),
            const SizedBox(height: 20),
            const Text(
              'Do you want to manage waste or assist with collection?',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(const Color(0xFF4CAC3E)),
                ),
                onPressed: () {
                  // Define what happens when the button is pressed
                  print('First button pressed!');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Signup(),
                    ),
                  );
                },
                child: const Text('Trash Owner',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color(0xFF0D77B9)), // Fixed color format
                ),
                onPressed: () {
                  // Define what happens when the button is pressed
                  print('Second button pressed!');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Signup(),
                    ),
                  );
                },
                child: const Text('PickUp Agent',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
