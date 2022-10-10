import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/teacher.dart';

class TeachersSelectAlert extends StatelessWidget {
  final List<Teacher> teachers;
  final Function addEvaluator;
  final Project project;
  final Function refresh;

  const TeachersSelectAlert({
    super.key,
    required this.teachers,
    required this.addEvaluator,
    required this.project,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar avaliador'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (Teacher teacher in teachers) ...[
            ListTile(
              title: Text(teacher.name),
              onTap: () async {
                final result = await addEvaluator(project, teacher.id);

                if (result.success) {
                  Navigator.pop(context);

                  return showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      content: Text('Avaliador adicionado com sucesso'),
                    ),
                  ).then(
                    (value) {
                      refresh();
                      return Navigator.pop(context);
                    },
                  );
                } else {
                  return showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                            content: Text('Erro ao adicionar avaliador'),
                          )).then((value) {
                    Navigator.of(context).pop();
                  });
                }
              },
            ),
          ],
        ],
      ),
    );
  }
}
