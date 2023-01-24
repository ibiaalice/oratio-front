import 'package:flutter/material.dart';
import 'package:oratio/config/entities/teacher.dart';

class InsertEvaluatorModal extends StatefulWidget {
  final List<Teacher> teachers;
  final Function onAddEvaluator;

  const InsertEvaluatorModal({
    super.key,
    required this.teachers,
    required this.onAddEvaluator,
  });

  @override
  State<InsertEvaluatorModal> createState() => _InsertEvaluatorModalState();
}

class _InsertEvaluatorModalState extends State<InsertEvaluatorModal> {
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

                widget.onAddEvaluator(teacher);
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
