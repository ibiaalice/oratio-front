import 'package:flutter/material.dart';
import 'package:oratio/config/core/enums/home_options.dart';
import 'package:oratio/screen/home/options/coordinator_options/examination_boards/examination_option_section.dart';

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
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
      width: screenSize.width * 0.7,
      child: Column(
        children: [
          _optionsTitle(),
          _optionSection(),
        ],
      ),
    );
  }

  Widget _optionsTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 40.0, right: 40.0),
      child: Container(
        alignment: Alignment.topLeft,
        child: Text(
          widget.homeOptions.name,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget _optionSection() {
    switch (widget.homeOptions) {
      case HomeOptions.openSemester:
        return const SizedBox(
          child: Text('em desenvolvimento'),
        );
      case HomeOptions.teachers:
        return const SizedBox(
          child: Text('em desenvolvimento'),
        );
      case HomeOptions.students:
        return const SizedBox(
          child: Text('em desenvolvimento'),
        );
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
        return ExaminationOptionSection();
      case HomeOptions.results:
        return const SizedBox(
          child: Text('em desenvolvimento'),
        );
      default:
        return const Text('erro');
    }
  }
}
