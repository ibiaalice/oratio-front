import 'package:flutter/material.dart';
import 'package:oratio/utils/style/oratio_icons.dart';

enum HomeOptions {
  //Coordinator Options
  openSemester,
  closedSemester,
  teachers,
  students,
  calendar,
  attendances,
  projects,
  examinationBoard,
  results,
}

extension HomeOptionsExtensions on HomeOptions {
  String get name {
    switch (this) {
      //Coordinator Options
      case HomeOptions.openSemester:
        return 'Abrir Semestre';
      case HomeOptions.closedSemester:
        return 'Fechar Semestre';
      case HomeOptions.teachers:
        return 'Professores';
      case HomeOptions.students:
        return 'Alunos';
      case HomeOptions.calendar:
        return 'Calendário';
      case HomeOptions.attendances:
        return 'Acompanhamentos';
      case HomeOptions.projects:
        return 'Projetos';
      case HomeOptions.examinationBoard:
        return 'Banca Examinadora';
      case HomeOptions.results:
        return 'Resultados';
    }
  }

  IconData get icon {
    switch (this) {
      //Coordinator Options
      case HomeOptions.openSemester:
        return OratioIcons.book;
      case HomeOptions.closedSemester:
        return OratioIcons.book;
      case HomeOptions.teachers:
        return OratioIcons.users;
      case HomeOptions.students:
        return OratioIcons.graduationHat;
      case HomeOptions.calendar:
        return OratioIcons.calendar;
      case HomeOptions.attendances:
        return OratioIcons.bullhorn;
      case HomeOptions.projects:
        return OratioIcons.textAlignLeft;
      case HomeOptions.examinationBoard:
        return OratioIcons.select;
      case HomeOptions.results:
        return OratioIcons.license;
    }
  }
}
