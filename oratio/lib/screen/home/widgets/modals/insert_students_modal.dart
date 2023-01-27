import 'package:flutter/material.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class InsertStudentsModal extends StatefulWidget {
  final Function onInsert;
  final int semesterId;

  const InsertStudentsModal({
    super.key,
    required this.onInsert,
    required this.semesterId,
  });

  @override
  State<InsertStudentsModal> createState() => _InsertStudentsModalState();
}

class _InsertStudentsModalState extends State<InsertStudentsModal> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final registrationController = TextEditingController();
    final emailController = TextEditingController();

    return AlertDialog(
      title: const Text('Adicionar Aluno individualmente'),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar',
              style: TextStyle(color: OratioColors.alertRed)),
        ),
        TextButton(
          onPressed: () async {
            if (nameController.text.isEmpty ||
                registrationController.text.isEmpty ||
                emailController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Preencha todos os campos'),
                ),
              );
            } else {
              final Student student = Student(
                name: nameController.text,
                registrationCourseNumber: registrationController.text,
                email: emailController.text,
                semester: widget.semesterId,
              );

              await widget.onInsert(student);
            }
          },
          child: const Text('Adicionar'),
        ),
      ],
      content: SizedBox(
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome Completo',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Nome não pode ser vazio";
                  }
                  return null;
                },
              ),
              _space(),
              TextFormField(
                controller: registrationController,
                decoration: const InputDecoration(
                  labelText: 'Matrícula',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Matrícula não pode ser vazia";
                  }
                  return null;
                },
              ),
              _space(),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Email não pode ser vazio";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _space() {
    return const SizedBox(height: 10);
  }
}
