import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class LoginTitleCard extends StatelessWidget {
  const LoginTitleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      alignment: Alignment.centerLeft,
      child: const Text(
        'Login',
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'Play',
          color: OratioColors.black,
        ),
      ),
    );
  }
}
