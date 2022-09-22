import 'package:flutter/material.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: OratioColors.background,
      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(
            color: OratioColors.text,
            fontFamily: 'Play',
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
