import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/screen/home/options/coordinator_options/coordinator_section_store.dart';
import 'package:oratio/screen/home/options/coordinator_options/examination_boards/widgets/coordinator_project_card.dart';
import 'package:oratio/screen/home/options/coordinator_options/examination_boards/widgets/teachers_select_alert.dart';
import 'package:oratio/screen/home/widgets/circle_pending_load.dart';
import 'package:oratio/utils/widgets/semester_aside_drop_button.dart';

class ExaminationOptionSection extends StatefulWidget {
  const ExaminationOptionSection({
    super.key,
  });

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
    return Observer(builder: (context) {
      if (store.isLoading) {
        return const CirclePendingLoad();
      }
      return SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SemesterAsideDropButton(
              semesterSelected: store.semesterSelected,
              semesters: store.semesters,
              onTapSemester: (Semester semester) =>
                  store.selectSemester(semester),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01,
                ),
                crossAxisCount: 4,
                shrinkWrap: false,
                children: [
                  for (Project project in store.projects) ...[
                    CoordinatorProjectCard(
                      project: project,
                      student: store.getStudent(project.studentId),
                      advisor: store.getTeacher(project.teacherId),
                      evaluator: store.getTeacher(project.evaluatorId),
                      evaluator2: store.getTeacher(project.evaluatorId2),
                      onEdit: () => store.editProject(project),
                      onDelete: () => store.deleteProject(project),
                      onAddEvaluator: () {
                        Future.delayed(
                          const Duration(seconds: 0),
                          () => showDialog(
                            context: context,
                            builder: (context) => TeachersSelectAlert(
                              teachers: store.teachers,
                              project: project,
                              refresh: store.refresh,
                              addEvaluator: (Project project, int teacherId) =>
                                  store.addEvaluator(project, teacherId),
                            ),
                          ),
                        );
                      },
                      onAddEvaluator2: () {
                        Future.delayed(
                          const Duration(seconds: 0),
                          () => showDialog(
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
                          ),
                        );
                      },
                    ),
                  ]
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
