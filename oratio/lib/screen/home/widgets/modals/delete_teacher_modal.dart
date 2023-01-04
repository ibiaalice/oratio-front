import 'package:flutter/material.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class DeleteTeacherModal extends StatefulWidget {
  final Function onDelete;
  const DeleteTeacherModal({super.key, required this.onDelete});

  @override
  State<DeleteTeacherModal> createState() => _DeleteTeacherModalState();
}

class _DeleteTeacherModalState extends State<DeleteTeacherModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Deletar professor'),
      content: const SizedBox(
        height: 100,
        width: 100,
        child: Text('Tem certeza que deseja deletar o professor?'),
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
