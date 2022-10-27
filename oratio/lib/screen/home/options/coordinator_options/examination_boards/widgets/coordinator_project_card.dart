import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/utils/style/oratio_colors.dart';
import 'package:oratio/utils/style/oratio_icons.dart';

class CoordinatorProjectCard extends StatelessWidget {
  final Project project;

  final Student student;
  final Teacher? advisor;
  final Teacher? evaluator;
  final Teacher? evaluator2;
  final Function() onEdit;
  final Function() onDelete;
  final Function() onAddEvaluator;
  final Function() onAddEvaluator2;

  const CoordinatorProjectCard({
    super.key,
    required this.project,
    required this.student,
    this.advisor,
    this.evaluator,
    this.evaluator2,
    required this.onEdit,
    required this.onDelete,
    required this.onAddEvaluator,
    required this.onAddEvaluator2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: OratioColors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        trailing: PopupMenuButton(
          enabled: true,
          icon: const Icon(Icons.more_vert, color: OratioColors.black),
          itemBuilder: (context) => [
            PopupMenuItem(
              onTap: onEdit,
              child: _titlePopMenu('Editar', OratioIcons.pencil),
            ),
            PopupMenuItem(
              onTap: onDelete,
              child: _titlePopMenu('Eliminar', OratioIcons.trash),
            ),
            if (project.evaluatorId == null)
              PopupMenuItem(
                onTap: onAddEvaluator,
                child: _titlePopMenu('Adicionar Avaliador', OratioIcons.user),
              ),
            if (project.evaluatorId2 == null && project.evaluatorId != null)
              PopupMenuItem(
                onTap: onAddEvaluator2,
                child: _titlePopMenu('Adicionar Avaliador 2', OratioIcons.user),
              ),
          ],
        ),
        isThreeLine: true,
        title: _title(),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _subtitle('autor', student.name, context),
            if (advisor != null)
              _subtitle('orientador', advisor!.name, context),
            if (evaluator != null)
              _subtitle(
                'avaliador: ',
                evaluator!.name,
                context,
              ),
            if (evaluator2 != null)
              _subtitle(
                'segundo avaliador',
                evaluator2!.name,
                context,
              ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(project.title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
    );
  }

  Widget _subtitle(String title, String value, context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title ',
            style: const TextStyle(color: OratioColors.black, fontSize: 14),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            width: screenSize.width * 0.1,
            child: Text(value, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _titlePopMenu(String value, IconData iconData) {
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(width: 10),
        Text(value),
      ],
    );
  }
}
