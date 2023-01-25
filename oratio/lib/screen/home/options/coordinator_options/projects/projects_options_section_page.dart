// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/screen/home/options/coordinator_options/projects/projects_options_section_store.dart';
import 'package:oratio/screen/home/widgets/circle_pending_load.dart';
import 'package:oratio/screen/home/widgets/modals/delete_project_modal.dart';
import 'package:oratio/screen/home/widgets/modals/edit_project_modal.dart';
import 'package:oratio/screen/home/widgets/modals/insert_evaluator_modal.dart';
import 'package:oratio/utils/style/oratio_colors.dart';
import 'dart:js' as js;

import 'package:oratio/utils/widgets/error_message_alert.dart';
import 'package:oratio/utils/widgets/success_message_alert.dart';

class ProjectsOptionsSection extends StatefulWidget {
  const ProjectsOptionsSection({super.key});

  @override
  State<ProjectsOptionsSection> createState() => _ProjectsOptionsSectionState();
}

class _ProjectsOptionsSectionState extends State<ProjectsOptionsSection> {
  final ProjectsOptionsSectionStore store = ProjectsOptionsSectionStore();

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

      return Container(
        padding: const EdgeInsets.only(right: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (Project project in store.projects) ...[
                _projectTile(project),
                _spacer(),
              ]
            ],
          ),
        ),
      );
    });
  }

  Widget _projectTile(Project project) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleInfo('Título:'),
                  Text(project.title, style: const TextStyle(fontSize: 16.0)),
                  _spacer(),
                  if (project.description != null) ...[
                    _titleInfo('Descrição:'),
                    Text(project.description!,
                        style: const TextStyle(fontSize: 16.0)),
                    _spacer(),
                  ],
                  if (project.link != null) ...[
                    _titleInfo('Link:'),
                    TextButton(
                      onPressed: () {
                        js.context.callMethod('open', [project.link]);
                      },
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          '${project.link}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                    _spacer()
                  ],
                  if (project.teacherId != null) ...[
                    _titleInfo('Orientador:'),
                    Text(
                      store.getTeacherById(project.teacherId!).name,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    _spacer()
                  ],
                  if (project.evaluatorId != null) ...[
                    _titleInfo('Avaliador:'),
                    Text(
                      store.getTeacherById(project.evaluatorId!).name,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    _spacer()
                  ],
                  _spacer()
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return EditProjectModal(
                              teacher: store.getTeacherById(project.teacherId!),
                              student: store.getStudentById(project.studentId),
                              teachers: store.teachers,
                              project: project,
                              onEditProject: (Project project) async {
                                // final result = await store.editProject(project);

                                // if (result.success) {
                                //   showDialog(
                                //       context: context,
                                //       builder: (context) {
                                //         return SuccessMessageAlert(
                                //             message: result.message);
                                //       });
                                // } else {
                                //   showDialog(
                                //       context: context,
                                //       builder: (context) {
                                //         return ErrorMessageAlert(
                                //             message: result.message);
                                //       });
                                // }
                              },
                            );
                          });
                    },
                    child: const Text('Editar projeto'),
                  ),
                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return InsertEvaluatorModal(
                                teachers: store.teachers,
                                onAddEvaluator: (Teacher teacher) async {
                                  // final result =
                                  //     await store.addEvaluator(teacher);

                                  // if (result.success) {
                                  //   showDialog(
                                  //       context: context,
                                  //       builder: (context) {
                                  //         return SuccessMessageAlert(
                                  //             message: result.message);
                                  //       });
                                  // } else {
                                  //   showDialog(
                                  //       context: context,
                                  //       builder: (context) {
                                  //         return ErrorMessageAlert(
                                  //             message: result.message);
                                  //       });
                                  // }
                                },
                              );
                            });
                      },
                      child: Text(
                        project.evaluatorId == null
                            ? 'Adicionar avaliador'
                            : 'Trocar avaliador',
                      )),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => DeleteModal(
                          onDelete: () async {
                            // final result = await store.deleteProject();
                            // if (result.success) {
                            //   const SuccessMessageAlert(
                            //     message: 'Projeto excluído com sucesso!',
                            //   );
                            // } else {
                            //   const ErrorMessageAlert(
                            //     message: 'Erro ao excluir projeto!',
                            //   );
                            // }
                          },
                          title: 'Excluir projeto',
                          message: 'Tem certeza que deseja excluir o projeto?',
                        ),
                      );
                    },
                    child: const Text(
                      'Excluir projeto',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _spacer() => const SizedBox(height: 10.0);

  Widget _titleInfo(String info) => Text(
        info,
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      );
}
