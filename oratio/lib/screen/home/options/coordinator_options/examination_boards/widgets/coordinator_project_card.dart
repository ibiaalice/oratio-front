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
    final screenSize = MediaQuery.of(context).size;

    return Card(
      color: OratioColors.primary,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // _iconRow(),

            SizedBox(
              width: screenSize.width * 0.5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _titleRow(project.title),
                    _smallSpacer(),
                    _secondColumn(),
                    _smallSpacer(),
                    _thirdLine(),
                    if (evaluator2 != null) ...[
                      _smallSpacer(),
                      _fourthLine(),
                    ],
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (evaluator == null) ...[
                  _optionCard(
                    iconData: OratioIcons.user,
                    title: 'Adicionar avaliador',
                    onTap: onAddEvaluator,
                  ),
                  _spacer(),
                ],
                if (evaluator != null && evaluator2 == null) ...[
                  _optionCard(
                    iconData: OratioIcons.user,
                    title: 'Adicionar Segundo avaliador',
                    onTap: onAddEvaluator2,
                  ),
                  _spacer(),
                ],
                _optionCard(
                  iconData: OratioIcons.trash,
                  title: 'Remover projeto',
                  onTap: onDelete,
                ),
                _spacer(),
                _optionCard(
                  iconData: OratioIcons.pencil,
                  title: 'Editar',
                  onTap: onEdit,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _spacer() => const SizedBox(height: 20);
  Widget _smallSpacer() => const SizedBox(height: 10);

  Widget _optionCard({
    required IconData iconData,
    required String title,
    required Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            iconData,
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _secondColumn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _contentRow('Autor:'),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: _contentRow(student.name),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _subContentRow('Orientador:'),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: _subContentRow(advisor?.name ?? 'Não atribuído'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _thirdLine() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _subContentRow('Avaliador:'),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: _subContentRow(evaluator?.name ?? 'Não atribuído'),
        ),
      ],
    );
  }

  Widget _fourthLine() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _subContentRow('Avaliador 2:'),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: _subContentRow(evaluator2?.name ?? 'Não atribuído'),
        ),
      ],
    );
  }

  Widget _iconRow() {
    return Container(
      alignment: Alignment.centerRight,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Icon(OratioIcons.textAlignLeft, size: 40),
      ),
    );
  }

  Widget _titleRow(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
    );
  }

  Widget _contentRow(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16),
    );
  }

  Widget _subContentRow(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, color: OratioColors.medium2Grey),
    );
  }
}
