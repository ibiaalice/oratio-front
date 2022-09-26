import 'package:flutter/material.dart';

class AsideOptionButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Function onPressed;

  const AsideOptionButton({
    Key? key,
    required this.iconData,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30.0),
      child: SizedBox(
        height: screenSize.height * 0.03,
        child: GestureDetector(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(iconData),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          onTap: () => onPressed(),
        ),
      ),
    );
  }
}
