// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class DeleteAccompanimentsModal extends StatefulWidget {
  final Function onDelete;

  const DeleteAccompanimentsModal({
    super.key,
    required this.onDelete,
  });

  @override
  State<DeleteAccompanimentsModal> createState() =>
      _DeleteAccompanimentsModalState();
}

class _DeleteAccompanimentsModalState extends State<DeleteAccompanimentsModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Deletar Acompanhamentos'),
      content: const SizedBox(
        height: 100,
        width: 100,
        child: Text('Tem certeza que deseja deletar o acompanhamento?'),
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
          child: const Text(
            'sim',
            style: TextStyle(color: OratioColors.alertRed),
          ),
        ),
      ],
    );
  }
}
