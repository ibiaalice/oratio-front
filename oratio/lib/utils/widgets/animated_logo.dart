import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
          left: screenSize.width * 0.1, top: screenSize.height * 0.05),
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'Oratio',
            textStyle: const TextStyle(
              fontSize: 94.0,
              fontFamily: 'Play',
              color: OratioColors.text,
              shadows: [Shadow(color: Colors.black54, blurRadius: 30)],
              height: 2,
              fontWeight: FontWeight.w300,
            ),
            speed: const Duration(milliseconds: 300),
          ),
        ],
        totalRepeatCount: 1,
        pause: const Duration(milliseconds: 1000),
        displayFullTextOnTap: true,
        stopPauseOnTap: true,
      ),
    );
  }

  Widget little(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'Oratio',
            textStyle: const TextStyle(
              fontSize: 72.0,
              fontFamily: 'Play',
              color: OratioColors.text,
              // shadows: [Shadow(color: Colors.black54, blurRadius: 30)],
              height: 2,
              fontWeight: FontWeight.w300,
            ),
            speed: const Duration(milliseconds: 300),
          ),
        ],
        totalRepeatCount: 1,
        pause: const Duration(milliseconds: 1000),
        displayFullTextOnTap: false,
        stopPauseOnTap: true,
      ),
    );
  }
}
