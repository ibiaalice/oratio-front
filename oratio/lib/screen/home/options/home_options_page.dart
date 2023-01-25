import 'package:flutter/material.dart';
import 'package:oratio/config/core/enums/home_options.dart';
import 'package:oratio/screen/home/options/coordinator_options/closed_semester/closed_semester_option_section.dart';
import 'package:oratio/screen/home/options/coordinator_options/open_semester/open_semester_option_section.dart';
import 'package:oratio/screen/home/options/coordinator_options/projects/projects_options_section_page.dart';
import 'package:oratio/screen/home/options/coordinator_options/students/students_option_section.dart';
import 'package:oratio/screen/home/options/coordinator_options/teachers/teachers_option_section.dart';

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
      case HomeOptions.projects:
        return const ProjectsOptionsSection();

      default:
        return const Text('erro');
    }
  }
}
