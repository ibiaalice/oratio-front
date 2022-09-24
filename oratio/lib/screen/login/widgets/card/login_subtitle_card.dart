import 'package:flutter/material.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class LoginSubtitleCard extends StatelessWidget {
  const LoginSubtitleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: const Text(
        'Realize o seu login abaixo',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Play',
          color: OratioColors.mediumGrey,
        ),
      ),
    );
  }
}
