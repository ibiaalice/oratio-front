// ignore_for_file: use_build_context_synchronously
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/screen/home/options/coordinator_options/coordinator_section_store.dart';
import 'package:oratio/screen/home/widgets/circle_pending_load.dart';
import 'package:oratio/screen/home/widgets/modals/delete_project_modal.dart';
import 'package:oratio/screen/home/widgets/modals/insert_teachers_by_sheet_modal.dart';
import 'package:oratio/screen/home/widgets/modals/insert_teachers_modal.dart';
import 'package:oratio/utils/style/oratio_colors.dart';
import 'package:oratio/utils/style/oratio_icons.dart';
import 'package:oratio/utils/widgets/error_message_alert.dart';
import 'package:oratio/utils/widgets/success_message_alert.dart';

class TeachersOptionsSection extends StatefulWidget {
  const TeachersOptionsSection({Key? key}) : super(key: key);

  @override
  State<TeachersOptionsSection> createState() => _TeachersOptionsSectionState();
}

class _TeachersOptionsSectionState extends State<TeachersOptionsSection> {
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
            _teacherListOptions(),
            Expanded(
              child: ListView(
                children: [
                  for (final teacher in store.filteredTeachers)
                    _teacherTile(teacher),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _teacherTile(Teacher teacher) {
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
                Text(teacher.name, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text(teacher.email, style: const TextStyle(fontSize: 15)),
                const SizedBox(height: 10),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(OratioIcons.pencil),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DeleteModal(
                            title: 'Excluir professor',
                            message:
                                'Deseja Excluir o professor ${teacher.name}?',
                            onDelete: () async {
                              final result = await store.deleteTeacher(teacher);

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

  Widget _teacherListOptions() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _optionButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return InsertTeachersModal(
                            onInsert: (Teacher teacher) async {
                              final result = await store.addTeacher(teacher);

                              if (result.success) {
                                Navigator.pop(context);

                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const SuccessMessageAlert(
                                    message: "Professor adicionado com sucesso",
                                  ),
                                );
                              } else {
                                Navigator.pop(context);

                                showDialog(
                                  context: context,
                                  builder: (context) => const ErrorMessageAlert(
                                    message: "Professor não adicionado",
                                  ),
                                );
                              }
                            },
                          );
                        });
                  },
                  iconData: OratioIcons.plusCircle,
                  text: 'Inserir professor individualmente',
                ),
                _optionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => InsertTeachersBySheetModal(
                        onInsert: (String sheet) async {
                          final result =
                              await store.addTeacherBySpreedsheet(sheet);

                          if (result.success) {
                          } else {}
                        },
                      ),
                    );
                  },
                  iconData: OratioIcons.fileAdd,
                  text: 'Inserir professores por tabela',
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
          hintText: 'Pesquisar professor',
          prefixIcon: Icon(CupertinoIcons.search),
        ),
        onChanged: (value) {
          store.setFilterTeacher(value);
          log('value: $value');
        },
      ),
    );
  }

  Widget _optionButton({
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
