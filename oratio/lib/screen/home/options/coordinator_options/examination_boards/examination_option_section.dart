import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/screen/home/options/coordinator_options/coordinator_section_store.dart';
import 'package:oratio/screen/home/options/coordinator_options/examination_boards/widgets/coordinator_project_card.dart';
import 'package:oratio/screen/home/options/coordinator_options/examination_boards/widgets/teachers_select_alert.dart';
import 'package:oratio/screen/home/widgets/circle_pending_load.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class ExaminationOptionSection extends StatefulWidget {
  const ExaminationOptionSection({super.key});

  @override
  State<ExaminationOptionSection> createState() =>
      _ExaminationOptionSectionState();
}

class _ExaminationOptionSectionState extends State<ExaminationOptionSection> {
  final store = CoordinatorSectionStore();

  @override
  void initState() {
    super.initState();
    store.onInit();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Observer(
      builder: (context) {
        if (store.isLoading) {
          return const CirclePendingLoad();
        }

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Container(
              color: OratioColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  for (Project project in store.projects) ...[
                    CoordinatorProjectCard(
                      project: project,
                      student: store.getStudent(project.studentId),
                      advisor: store.getTeacher(project.teacherId),
                      evaluator: store.getTeacher(project.evaluatorId),
                      evaluator2: store.getTeacher(project.evaluatorId2),
                      onEdit: () {
                        log('edit');
                      },
                      onDelete: () {
                        log('delete');
                      },
                      onAddEvaluator: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return TeachersSelectAlert(
                              teachers: store.teachers,
                              addEvaluator: store.addEvaluator,
                              project: project,
                              refresh: () {
                                store.refresh();
                              },
                            );
                          },
                        );
                      },
                      onAddEvaluator2: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return TeachersSelectAlert(
                              teachers: store.teachers,
                              addEvaluator: store.addEvaluator2,
                              project: project,
                              refresh: () {
                                store.refresh();
                              },
                            );
                          },
                        );
                      },
                    ),
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
