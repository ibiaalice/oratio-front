// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class DeleteModal extends StatefulWidget {
  final Function onDelete;
  final String title;
  final String message;

  const DeleteModal({
    super.key,
    required this.onDelete,
    required this.title, required this.message,
  });

  @override
  State<DeleteModal> createState() => _DeleteModalState();
}

class _DeleteModalState extends State<DeleteModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        height: 100,
        width: 100,
        child: Text(widget.message),
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
