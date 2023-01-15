import 'package:flutter/material.dart';
import 'package:oratio/config/core/enums/home_options.dart';
import 'package:oratio/screen/home/options/coordinator_options/closed_semester/closed_semester_option_section.dart';
import 'package:oratio/screen/home/options/coordinator_options/examination_boards/examination_option_section.dart';
import 'package:oratio/screen/home/options/coordinator_options/open_semester/open_semester_option_section.dart';
import 'package:oratio/screen/home/options/coordinator_options/students/students_option_section.dart';
import 'package:oratio/screen/home/options/coordinator_options/teacher_option_section/teachers_option_section.dart';

class HomeOptionsPage extends StatefulWidget {
  final HomeOptions homeOptions;

  const HomeOptionsPage({
    super.key,
    required this.homeOptions,
  });

  @override
  State<HomeOptionsPage> createState() => _HomeOptionsPageState();
}

class _HomeOptionsPageState extends State<HomeOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return _optionSection();
  }

  Widget _optionSection() {
    switch (widget.homeOptions) {
      case HomeOptions.openSemester:
        return const OpenSemesterOptionSection();
      case HomeOptions.closedSemester:
        return const ClosedSemesterOptionSection();
      case HomeOptions.teachers:
        return const TeachersOptionsSection();
      case HomeOptions.students:
        return const StudentsOptionsSection();

      case HomeOptions.calendar:
        return const SizedBox(
          child: Text('em desenvolvimento'),
        );
      case HomeOptions.attendances:
        return const SizedBox(
          child: Text('em desenvolvimento'),
        );
      case HomeOptions.projects:
        return const SizedBox(
          child: Text('em desenvolvimento'),
        );
      case HomeOptions.examinationBoard:
        return const ExaminationOptionSection();

      case HomeOptions.results:
        return const SizedBox(
          child: Text('em desenvolvimento'),
        );
      default:
        return const Text('erro');
    }
  }
}
