// ignore_for_file: use_build_context_synchronously
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/screen/home/options/coordinator_options/coordinator_section_store.dart';
import 'package:oratio/screen/home/widgets/circle_pending_load.dart';
import 'package:oratio/screen/home/widgets/modals/delete_project_modal.dart';
import 'package:oratio/screen/home/widgets/modals/edit_student_modal.dart';
import 'package:oratio/screen/home/widgets/modals/insert_students_by_sheet_modal.dart';
import 'package:oratio/screen/home/widgets/modals/insert_students_modal.dart';
import 'package:oratio/screen/home/widgets/student_profile/student_profile_page.dart';
import 'package:oratio/utils/style/oratio_colors.dart';
import 'package:oratio/utils/style/oratio_icons.dart';
import 'package:oratio/utils/widgets/error_message_alert.dart';
import 'package:oratio/utils/widgets/success_message_alert.dart';

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

      if (store.studentSelected != null) {
        return Container(
          padding: const EdgeInsets.only(right: 40),
          child: StudentProfile(
            student: store.studentSelected!,
            onBack: () => store.studentSelected = null,
          ),
        );
      }

      return Container(
        padding: const EdgeInsets.only(right: 40),
        child: Column(
          children: [
            _studentsListOptions(),
            Expanded(
              child: ListView(
                children: [
                  for (final student in store.filteredStudents)
                    _studentTile(student),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _titleInfo(String info) => Text(
        info,
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      );

  Widget _spacer() => const SizedBox(height: 10);

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
                TextButton(
                  onPressed: () {
                    store.setStudentSelected(student);
                  },
                  child: Text(
                    student.name,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _spacer(),
                      _titleInfo('email:'),
                      Text(student.email, style: const TextStyle(fontSize: 15)),
                      _spacer(),
                      _titleInfo('matrícula:'),
                      Text(student.registrationCourseNumber,
                          style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return EditStudentModal(
                            student: student,
                            onEdit: (Student student) async {
                              final result = await store.editStudent(student);

                              if (result.success) {
                                Navigator.pop(context);

                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const SuccessMessageAlert(
                                    message: "Aluno atualizado com sucesso",
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => ErrorMessageAlert(
                                    message: result.message,
                                  ),
                                );
                              }
                            },
                          );
                        });
                  },
                  icon: const Icon(OratioIcons.pencil),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DeleteModal(
                            title: 'Excluir aluno',
                            message: 'Excluir deletar o aluno ${student.name}?',
                            onDelete: () async {
                              final result = await store.deleteStudent(student);

                              if (result.success) {
                                return showDialog(
                                  context: context,
                                  builder: (context) => SuccessMessageAlert(
                                    message: result.message,
                                  ),
                                );
                              } else {
                                return showDialog(
                                  context: context,
                                  builder: (context) => ErrorMessageAlert(
                                    message: result.message,
                                  ),
                                );
                              }
                            },
                          );
                        });
                  },
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
                if (store.isActiveSemester)
                  _textButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return InsertStudentsModal(
                              semesterId: store.semesterSelected!.id!,
                              onInsert: (Student student) async {
                                final result = await store.addStudent(student);

                                if (result.success) {
                                  Navigator.pop(context);

                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const SuccessMessageAlert(
                                      message: "Aluno adicionado com sucesso",
                                    ),
                                  );
                                } else {
                                  Navigator.pop(context);

                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const ErrorMessageAlert(
                                      message: "Aluno não adicionado",
                                    ),
                                  );
                                }
                              },
                            );
                          });
                    },
                    iconData: OratioIcons.plusCircle,
                    text: 'Inserir aluno individualmente',
                  ),
                _textButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return InsertStudentsBySheetModal(
                            onInsert: (String spreedsheatsId) async {
                              final result = await store
                                  .addStudentBySpreedsheet(spreedsheatsId);

                              if (result.success) {
                                Navigator.pop(context);

                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const SuccessMessageAlert(
                                    message: "Alunos adicionado com sucesso",
                                  ),
                                );
                              } else {
                                Navigator.pop(context);

                                showDialog(
                                  context: context,
                                  builder: (context) => const ErrorMessageAlert(
                                    message: "Alunos não adicionado",
                                  ),
                                );
                              }
                            },
                          );
                        });
                  },
                  iconData: OratioIcons.fileAdd,
                  text: 'Inserir alunos por tabela',
                ),
              ],
            ),
            _searchTextformfield(),
          ],
        ),
      ),
    );
  }

  Widget _searchTextformfield() {
    return SizedBox(
      width: 300,
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Pesquisar aluno',
          prefixIcon: Icon(CupertinoIcons.search),
        ),
        onChanged: (value) {
          store.setFilterStudent(value);
        },
      ),
    );
  }

  Widget _textButton({
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
