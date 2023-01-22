import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/config/core/format_data.dart';
import 'package:oratio/config/entities/accompaniments.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/screen/home/widgets/modals/delete_project_modal.dart';
import 'package:oratio/screen/home/widgets/modals/insert_accompaniments_modal.dart';
import 'package:oratio/screen/home/widgets/modals/insert_project_modal.dart';
import 'package:oratio/screen/home/widgets/student_profile/student_profile_store.dart';
import 'package:oratio/utils/style/oratio_colors.dart';
import 'package:oratio/utils/widgets/error_message_alert.dart';
import 'dart:js' as js;

import 'package:oratio/utils/widgets/success_message_alert.dart';

class StudentProfile extends StatefulWidget {
  final Student student;
  final VoidCallback onBack;

  const StudentProfile({
    super.key,
    required this.student,
    required this.onBack,
  });

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  final StudentProfileStore store = StudentProfileStore();

  @override
  void initState() {
    super.initState();
    store.onInit(widget.student);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Observer(builder: (_) {
      if (store.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return SingleChildScrollView(
        child: Container(
          color: OratioColors.white,
          width: screenSize.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _profileHeader(),
              _titleProfile(title: 'Detalhes do aluno'),
              _detailsProfile(),
              _titleProfile(title: 'Projeto'),
              _detailsProject(),
              _titleProfile(title: 'Acompanhamentos'),
              _accompanimentsProfileDetails(),
            ],
          ),
        ),
      );
    });
  }

  Widget _titleProfile({required String title}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(title,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
    );
  }

  Widget _detailsProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nome: ${store.student!.name}',
              style: const TextStyle(fontSize: 16.0)),
          const SizedBox(height: 10.0),
          Text('Email: ${store.student!.email}',
              style: const TextStyle(fontSize: 16.0)),
          const SizedBox(height: 10.0),
          Text('Matrícula: ${store.student!.registrationCourseNumber}',
              style: const TextStyle(fontSize: 16.0)),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget _detailsProject() {
    if (store.project == null) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return InsertProjectModal(
                      teachers: store.teachers,
                      student: store.student!,
                      onInsert: (Project project) async {
                        final result = await store.addProject(project);

                        if (result.success) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return SuccessMessageAlert(
                                    message: result.message);
                              });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ErrorMessageAlert(
                                    message: result.message);
                              });
                        }
                      },
                    );
                  });
            },
            child: const Text('Cadastrar projeto')),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(color: OratioColors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(store.project!.title,
                    style: const TextStyle(fontSize: 16.0)),
                const SizedBox(height: 10.0),
                const SizedBox(height: 10.0),
                TextButton(
                  onPressed: () {
                    js.context.callMethod('open', [store.project!.link]);
                  },
                  child: Container(
                    width: 200,
                    child: Text(
                      '${store.project!.link}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Editar projeto'),
                ),
                TextButton(
                    onPressed: () {}, child: const Text('Adicionar avaliador')),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => DeleteModal(
                        onDelete: () async {
                          final result = await store.deleteProject();
                          if (result.success) {
                            const SuccessMessageAlert(
                              message: 'Projeto excluído com sucesso!',
                            );
                          } else {
                            const ErrorMessageAlert(
                              message: 'Erro ao excluir projeto!',
                            );
                          }
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
    );
  }

  Widget _accompanimentsProfileDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: TextButton(
            child: const Text('Adicionar acompanhamento'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return InsertAccompanimentsModal(
                      student: store.student!,
                      onInsert: (Accompaniments accompaniments) async {
                        final result =
                            await store.addAccompaniments(accompaniments);

                        if (result.success) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return SuccessMessageAlert(
                                  message: result.message,
                                );
                              });
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return ErrorMessageAlert(
                                message: result.message,
                              );
                            },
                          );
                        }
                      },
                    );
                  });
            },
          ),
        ),
        if (store.accompaniments.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              for (Accompaniments accompaniments in store.accompaniments) ...[
                _accompanimentsItem(accompaniments: accompaniments)
              ]
            ]),
          )
        ],
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _accompanimentsItem({required Accompaniments accompaniments}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(color: OratioColors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(formatData(accompaniments.createdDate),
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 10.0),
            Text('${accompaniments.description}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 20.0),
            if (accompaniments.link != null && accompaniments.link!.isNotEmpty)
              Row(
                children: [
                  const Text('Arquivo anexado:'),
                  TextButton(
                    onPressed: () {
                      js.context.callMethod('open', [store.project!.link]);
                    },
                    child: SizedBox(
                      width: 400,
                      child: Text(
                        '${accompaniments.link}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Editar'),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DeleteModal(
                            message: 'Deseja excluir o acompanhamento?',
                            title: 'Excluir acompanhamento',
                            onDelete: () async {
                              final result = await store
                                  .deleteAccompaniments(accompaniments);

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
                  child: const Text(
                    'Excluir',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileHeader() {
    return Container(
      color: OratioColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: widget.onBack,
            icon: const Icon(Icons.arrow_back),
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 40.0, top: 8.0, bottom: 8.0, right: 8.0),
            child: Text('Perfil do aluno', style: TextStyle(fontSize: 16.0)),
          ),
        ],
      ),
    );
  }
}
