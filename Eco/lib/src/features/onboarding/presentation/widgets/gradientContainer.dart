import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GradientContainer extends StatelessWidget {
  final String heading;
  final String paragraph;
  final String buttonText;
  final VoidCallback onNext;
  final PageController pageController;

  const GradientContainer({
    super.key,
    required this.heading,
    required this.paragraph,
    required this.buttonText,
    required this.onNext,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2BAAD8), Color(0xFF31AF4E)],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(140),
          topRight: Radius.circular(140),
        ),
      ),
      child: Center(
        child: Container(
          height: 370,
          width: 315,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF31AF4E),
              width: 4,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Color(0xFF2BAAD8),
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 8,
                ),
              ),
              const SizedBox(height: 50),
              Image.asset('assets/Favicon transparent 3.png'),
              const SizedBox(height: 20),
              Text(
                heading,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  paragraph,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onNext,
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
