import 'package:flutter/material.dart';
import 'package:oratio/config/entities/teacher.dart';

class AddEvaluatorModal extends StatefulWidget {
  final List<Teacher> teachers;
  final Function onAddEvaluator;

  const AddEvaluatorModal({
    super.key,
    required this.teachers,
    required this.onAddEvaluator,
  });

  @override
  State<AddEvaluatorModal> createState() => _AddEvaluatorModalState();
}

class _AddEvaluatorModalState extends State<AddEvaluatorModal> {
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
