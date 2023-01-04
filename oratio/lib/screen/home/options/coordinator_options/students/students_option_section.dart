import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/screen/home/options/coordinator_options/coordinator_section_store.dart';
import 'package:oratio/screen/home/widgets/circle_pending_load.dart';
import 'package:oratio/utils/style/oratio_colors.dart';
import 'package:oratio/utils/style/oratio_icons.dart';

class StudentsOptionsSection extends StatefulWidget {
  const StudentsOptionsSection({Key? key}) : super(key: key);

  @override
  State<StudentsOptionsSection> createState() => _StudentsOptionsSectionState();
}

class _StudentsOptionsSectionState extends State<StudentsOptionsSection> {
  final CoordinatorSectionStore store = CoordinatorSectionStore();

  @override
  void initState() {
    super.initState();
    store.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (store.isLoading) return const CirclePendingLoad();
      return Container(
        padding: const EdgeInsets.only(right: 40),
        child: Column(
          children: [
            _studentsListOptions(),
            Expanded(
              child: ListView(
                children: [
                  for (final student in store.students) _studentTile(student),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _studentTile(Student student) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(student.name, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text(student.email, style: const TextStyle(fontSize: 15)),
                const SizedBox(height: 10),
                Text(student.registrationCourseNumber,
                    style: const TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(OratioIcons.pencil),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    OratioIcons.trash,
                    color: OratioColors.alertRed,
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget _studentsListOptions() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _insertButton(
                  onPressed: () {},
                  iconData: OratioIcons.plusCircle,
                  text: 'Inserir aluno individualmente',
                ),
                _insertButton(
                  onPressed: () {},
                  iconData: OratioIcons.fileAdd,
                  text: 'Inserir alunos por tabela',
                ),
              ],
            ),
            _insertButton(
              onPressed: () {},
              iconData: CupertinoIcons.search,
              text: 'Procurar Alunos',
            ),
          ],
        ),
      ),
    );
  }

  Widget _insertButton({
    required VoidCallback onPressed,
    required IconData iconData,
    required String text,
  }) {
    return TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(iconData, color: OratioColors.black),
            const SizedBox(width: 10),
            Text(text, style: const TextStyle(color: OratioColors.black)),
          ],
        ));
  }
}
