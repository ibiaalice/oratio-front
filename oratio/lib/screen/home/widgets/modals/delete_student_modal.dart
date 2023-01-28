import 'package:flutter/material.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class DeleteStudentModal extends StatefulWidget {
  final Function onDelete;
  const DeleteStudentModal({super.key, required this.onDelete});

  @override
  State<DeleteStudentModal> createState() => _DeleteStudentModalState();
}

class _DeleteStudentModalState extends State<DeleteStudentModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Deletar Aluno'),
      content: const SizedBox(
        height: 100,
        width: 100,
        child: Text('Tem certeza que deseja deletar o aluno?'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('cancelar'),
        ),
        TextButton(
          onPressed: () async {
            await widget.onDelete();

            Navigator.of(context).pop();
          },
          child:
              const Text('sim', style: TextStyle(color: OratioColors.alertRed)),
        ),
      ],
    );
  }
}
