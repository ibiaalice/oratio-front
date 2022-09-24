import 'package:flutter/material.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          height: screenSize.height * 0.07,
          decoration: const BoxDecoration(color: OratioColors.black),
          child: const Text(
            'Login',
            style: TextStyle(
              color: OratioColors.white,
              fontFamily: 'Play',
            ),
          ),
        ),
      ),
    );
  }
}
