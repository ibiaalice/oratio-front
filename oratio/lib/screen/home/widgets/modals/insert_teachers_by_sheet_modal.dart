import 'package:flutter/material.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class InsertTeachersBySheetModal extends StatefulWidget {
  final Function onInsert;
  const InsertTeachersBySheetModal({super.key, required this.onInsert});

  @override
  State<InsertTeachersBySheetModal> createState() =>
      _InsertTeachersBySheetModalState();
}

class _InsertTeachersBySheetModalState
    extends State<InsertTeachersBySheetModal> {
  final sheetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AlertDialog(
      title: const Text('Adicionar professores via Google Sheets'),
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
            } else {}
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
