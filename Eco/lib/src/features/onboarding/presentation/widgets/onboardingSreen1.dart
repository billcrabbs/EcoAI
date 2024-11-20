import 'dart:ui'; // Required for BackdropFilter
import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  final String imagePath;
  final String content;
  final double hei;
  final double height;
  final double width;

  const PageContent({
    Key? key,
    required this.imagePath,
    this.hei = -2.0,
    this.height = 240,
    this.width = 240,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Transform.translate(
          offset: const Offset(-70, -100),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        // Blur effect
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        // Foreground image
        Transform.translate(
          offset: const Offset(80, 140),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(content),
                fit: BoxFit.fill,
                alignment: Alignment(-0.5, hei),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
