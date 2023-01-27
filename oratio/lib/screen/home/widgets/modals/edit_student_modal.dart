import 'package:flutter/material.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class EditStudentModal extends StatefulWidget {
  final Function onEdit;
  final Student student;

  const EditStudentModal({
    super.key,
    required this.onEdit,
    required this.student,
  });

  @override
  State<EditStudentModal> createState() => _EditStudentModalState();
}

class _EditStudentModalState extends State<EditStudentModal> {
  final nameController = TextEditingController();
  final registrationController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = widget.student.name;
    registrationController.text = widget.student.registrationCourseNumber;
    emailController.text = widget.student.email;
  }

  Student get _student => Student(
        id: widget.student.id,
        name: nameController.text,
        email: emailController.text,
        semester: widget.student.semester,
        registrationCourseNumber: registrationController.text,
      );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Editar Aluno'),
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
              await widget.onEdit(_student);
            }
          },
          child: const Text('Editar'),
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
