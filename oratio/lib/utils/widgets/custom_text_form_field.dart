import 'package:flutter/material.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final Function onChanged;
  final String title;
  final isPassword;

  const CustomTextFormField({
    super.key,
    required this.onChanged,
    required this.title,
    this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: const TextStyle(
                color: OratioColors.black,
                fontSize: 16,
                fontFamily: 'Play',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: OratioColors.grey,
            child: Column(
              children: [
                TextFormField(
                  obscureText: isPassword ?? false,
                  onChanged: (value) => onChanged(value),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                      color: OratioColors.medium2Grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
