import 'package:flutter/material.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class RegisterButton extends StatelessWidget {
  final Function onPressed;
  const RegisterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: TextButton(
        onPressed: () => onPressed(),
        child: const Text(
          'Cadastre-se',
          style: TextStyle(
            color: OratioColors.text,
            fontFamily: 'Play',
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
