import 'package:flutter/material.dart';

class ActiveSemesterAlert extends StatelessWidget {
  const ActiveSemesterAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 500,
      width: 500,
      child: Center(child: Card(child: Text('Semestre em andamento'))),
    );
  }
}
