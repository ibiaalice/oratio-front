import 'package:flutter/material.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/teacher.dart';

class InsertEvaluatorAlert extends StatefulWidget {
  final List<Teacher> teachers;
  final Project project;
  final Function onAddEvaluator;

  const InsertEvaluatorAlert({
    super.key,
    required this.teachers,
    required this.onAddEvaluator,
    required this.project,
  });

  @override
  State<InsertEvaluatorAlert> createState() => _InsertEvaluatorAlertState();
}

class _InsertEvaluatorAlertState extends State<InsertEvaluatorAlert> {
  Teacher? teacher;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Escolha o professor'),
      content: Container(
        width: 500,
        height: 400,
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: widget.teachers.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                setState(() {
                  teacher = widget.teachers[index];
                });

                widget.onAddEvaluator(teacher, widget.project);
                Navigator.pop(context);
              },
              title: Text(widget.teachers[index].name),
            );
          },
        ),
      ),
    );
  }
}
