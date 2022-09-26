import 'package:flutter/material.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class CirclePendingLoad extends StatelessWidget {
  const CirclePendingLoad({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height * 0.5,
      width: screenSize.width * 0.5,
      child: Center(
        child: Card(
          color: OratioColors.white,
          child: SizedBox(
            height: screenSize.height * 0.2,
            width: screenSize.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    color: OratioColors.black,
                    strokeWidth: 10,
                  ),
                ),
                Text('Carregando'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
