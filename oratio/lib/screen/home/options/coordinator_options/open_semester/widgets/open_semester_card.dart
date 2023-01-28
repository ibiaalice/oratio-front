import 'package:flutter/material.dart';
import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/utils/style/oratio_colors.dart';
import 'package:oratio/utils/widgets/error_message_alert.dart';
import 'package:oratio/utils/widgets/success_message_alert.dart';

class OpenSemesterCard extends StatefulWidget {
  final Function initSemester;

  const OpenSemesterCard({super.key, required this.initSemester});

  @override
  State<OpenSemesterCard> createState() => _OpenSemesterCardState();
}

class _OpenSemesterCardState extends State<OpenSemesterCard> {
  DateTime? initialDate = DateTime.now();
  DateTime? finalDate = DateTime.now();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();

  Semester _mountSemester() {
    return Semester(
      semester: _semesterController.text,
      year: _yearController.text,
      start: initialDate!,
      end: finalDate,
      status: 'ACTIVE',
    );
  }

  MaterialBanner _redBanner(String message) => MaterialBanner(
        onVisible: () => Future.delayed(
          const Duration(seconds: 3),
          () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
        ),
        actions: [
          TextButton(
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            child: const Text(
              'Fechar',
              style: TextStyle(
                color: OratioColors.white,
              ),
            ),
          ),
        ],
        content: Text(
          message,
          style: const TextStyle(
            color: OratioColors.white,
          ),
        ),
        backgroundColor: OratioColors.alertRed,
      );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 40.0),
            child: Text(
              'Selecione o período do semestre letivo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.02,
                vertical: screenSize.height * 0.02,
              ),
              width: screenSize.width * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _nameInfoSemester(),
                  _datesPicker(),
                  _confirmButton(
                    onPressed: () async {
                      final semester = _mountSemester();

                      if (semester.year.isEmpty ||
                          semester.semester.isEmpty ||
                          semester.end == null) {
                        ScaffoldMessenger.of(context).showMaterialBanner(
                          _redBanner('Preencha todos os campos'),
                        );
                      } else {
                        final Result result =
                            await widget.initSemester(semester);

                        if (result.success) {
                          return showDialog(
                            context: context,
                            builder: (context) => const SuccessMessageAlert(
                              message: "Semestre iniciado com sucesso",
                            ),
                          );
                        } else {
                          return showDialog(
                            context: context,
                            builder: (context) => const ErrorMessageAlert(
                              message: "Desculpe, ocorreu um erro",
                            ),
                          );
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _confirmButton({
    required VoidCallback onPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onPressed,
          child: const Text('Iniciar Semestre'),
        ),
      ],
    );
  }

  Widget _datesPicker() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          children: [
            _datePicker(
                date: initialDate!,
                title: 'início do semestre',
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2040),
                  );

                  setState(() {
                    initialDate = date;
                  });
                }),
            const SizedBox(width: 60),
            _datePicker(
                title: 'Final do semestre',
                date: finalDate!,
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2040),
                  );

                  setState(() {
                    finalDate = date;
                  });
                }),
          ],
        ),
      );

  Widget _nameInfoSemester() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              child: TextFormField(
                controller: _yearController,
                decoration: const InputDecoration(
                  labelText: 'Ano do semestre',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 100),
            SizedBox(
              width: 100,
              child: TextFormField(
                controller: _semesterController,
                decoration: const InputDecoration(
                  labelText: 'Período',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _datePicker({
    required String title,
    required final DateTime date,
    required Function onPressed,
  }) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            Card(
              child: SizedBox(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 10),
                      Text(
                        _dateTimeFormat(date),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _dateTimeFormat(DateTime date) {
    final list = (date.toString().split('-'));
    final day = list[2].split(' ')[0];
    return ('$day/ ${list[1]}/ ${list[0]}');
  }
}
