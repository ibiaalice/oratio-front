import 'package:flutter/material.dart';
import 'package:oratio/config/entities/accompaniments.dart';
import 'package:oratio/config/entities/student.dart';

class EditAccompanimentsModal extends StatefulWidget {
  final Student student;
  final Function onEditAccompaniments;
  final Accompaniments accompaniments;

  const EditAccompanimentsModal({
    super.key,
    required this.student,
    required this.onEditAccompaniments,
    required this.accompaniments,
  });

  @override
  State<EditAccompanimentsModal> createState() =>
      _EditAccompanimentsModalState();
}

class _EditAccompanimentsModalState extends State<EditAccompanimentsModal> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  final createdDate = DateTime.now();

  get accompaniments => Accompaniments(
        id: widget.accompaniments.id,
        studentId: widget.student.id!,
        description: descriptionController.text,
        link: linkController.text,
        createdDate: createdDate,
      );

  @override
  void initState() {
    super.initState();
    descriptionController.text = widget.accompaniments.description!;
    linkController.text = widget.accompaniments.link!;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Editar acompanhamento'),
      content: Container(
        width: 500,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Descrição'),
            TextField(
              controller: descriptionController,
              maxLength: 256,
            ),
            const SizedBox(height: 20),
            const Text('Link (opcional)'),
            TextField(
              controller: linkController,
              style: const TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            if (descriptionController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Preencha a descrição do acompanhamento'),
                ),
              );
              return;
            }
            widget.onEditAccompaniments(accompaniments);

            Navigator.of(context).pop();
          },
          child: const Text('Editar'),
        ),
      ],
    );
  }
}
