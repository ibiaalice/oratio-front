import 'package:flutter/material.dart';
import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/utils/style/oratio_icons.dart';

class SemesterAsideDropButton extends StatelessWidget {
  final Semester? semesterSelected;
  final List<Semester> semesters;
  final Function onTapSemester;

  const SemesterAsideDropButton({
    super.key,
    required this.semesterSelected,
    required this.semesters,
    required this.onTapSemester,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
      width: screenSize.width * 0.5,
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Selecione o semestre:', style: TextStyle(fontSize: 16)),
          DropdownButton(
            icon: const Icon(OratioIcons.arrowDown, size: 15),
            hint: const Text('Semestre '),
            borderRadius: BorderRadius.circular(10),
            value: semesterSelected,
            items: [
              for (Semester semester in semesters) ...[
                DropdownMenuItem(
                  value: semester,
                  child: Text('${semester.year}.${semester.semester}'),
                )
              ],
            ],
            onChanged: (value) {
              onTapSemester(value);
            },
          ),
        ],
      ),
    );
  }
}
