import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SuccessMessageAlert extends StatelessWidget {
  final String message;
  const SuccessMessageAlert({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sucesso'),
      content: SizedBox(
        height: 100,
        width: 100,
        child: Text(message),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
