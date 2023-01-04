import 'package:flutter/material.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class InsertTeachersModal extends StatefulWidget {
  final Function onInsert;
  const InsertTeachersModal({super.key, required this.onInsert});

  @override
  State<InsertTeachersModal> createState() => _InsertTeachersModalState();
}

class _InsertTeachersModalState extends State<InsertTeachersModal> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    final emailController = TextEditingController();

    return AlertDialog(
      title: const Text('Adicionar professor individualmente'),
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
            if (nameController.text.isEmpty || emailController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Preencha todos os campos'),
                ),
              );
            } else {
              final Teacher student = Teacher(
                name: nameController.text,
                email: emailController.text,
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
    return const SizedBox(
      height: 20,
    );
  }
}
