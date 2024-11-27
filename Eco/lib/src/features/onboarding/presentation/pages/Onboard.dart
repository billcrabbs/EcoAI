import 'package:flutter/material.dart';
import 'package:onboardingscreens/src/features/Authentication/Presentation/Pages/welcome/Welcome.dart';
// import '../../../Authentication/Presentation/Pages/auth.dart';
import '../widgets/gradientContainer.dart';
import '../widgets/onboardingSreen1.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to the Authenticate page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Welcome()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: const [
              PageContent(
                imagePath: 'assets/Bot.png',
                content: 'assets/Group 2.png',
              ),
              PageContent(
                imagePath: 'assets/Agent.png',
                content: 'assets/Agent.png',
                hei: 5.0,
              ),
              PageContent(
                imagePath: '',
                content: ' ', // Ensure a valid content asset
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GradientContainer(
              heading: _currentPage == 0
                  ? "Ready for a Trash Evolution"
                  : _currentPage == 1
                      ? "Simple and Friendly"
                      : "Join Us Now",
              paragraph: _currentPage == 0
                  ? "EcoAI is your eco-friendly companion for easy and convenient trash pickup. We're here to make a positive impact on the environment."
                  : _currentPage == 1
                      ? "It's as simple as that! Our AI-powered system will match you with a local EcoAI agent for a hassle-free pickup experience."
                      : "Ready to make the difference? Sign up now and start enjoying the benefits of EcoAI.",
              buttonText: _currentPage == 2 ? "Get Started" : "Next",
              onNext: _goToNextPage,
              pageController: _pageController,
            ),
          ),
        ],
      ),
    );
  }
}
