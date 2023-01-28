import 'package:flutter/material.dart';

class ActiveSemesterAlert extends StatelessWidget {
  const ActiveSemesterAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: SizedBox(
        height: 200,
        width: 500,
        child: Center(
            child: Text(
          'Semestre em andamento',
          style: TextStyle(fontSize: 20),
        )),
      ),
    );
  }
}
