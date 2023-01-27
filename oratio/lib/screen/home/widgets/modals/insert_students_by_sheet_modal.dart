import 'package:flutter/material.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class InsertStudentsBySheetModal extends StatefulWidget {
  final Function onInsert;
  const InsertStudentsBySheetModal({super.key, required this.onInsert});

  @override
  State<InsertStudentsBySheetModal> createState() =>
      _InsertStudentsBySheetModalState();
}

class _InsertStudentsBySheetModalState
    extends State<InsertStudentsBySheetModal> {
  final sheetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AlertDialog(
      title: const Text('Adicionar alunos via Google Sheets'),
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
            if (sheetController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Preencha o campo com uma tabela google sheets pública',
                  ),
                ),
              );
            } else {
              widget.onInsert(sheetController.text);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Adicionar'),
        ),
      ],
      content: SizedBox(
        width: screenSize.width * 0.6,
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.blue),
                controller: sheetController,
                decoration: const InputDecoration(
                  labelText: 'Link da tabela',
                ),
              ),
              _space(),
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
