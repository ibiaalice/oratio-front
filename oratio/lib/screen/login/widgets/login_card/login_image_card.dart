import 'package:flutter/material.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class LoginImageCard extends StatelessWidget {
  const LoginImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width * 0.2,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: screenSize.width * 0.18,
            height: screenSize.height * 0.21,
            color: OratioColors.primary,
          ),
          Image.asset('assets/images/student.png'),
        ],
      ),
    );
  }
}
