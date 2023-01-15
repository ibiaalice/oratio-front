import 'package:flutter/material.dart';
import 'package:oratio/config/core/enums/account_type.dart';
import 'package:oratio/config/core/enums/home_options.dart';
import 'package:oratio/screen/home/widgets/home_aside/aside_option_button.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class HomeAside extends StatefulWidget {
  final AccountType? accountType;
  final bool isActiveSemester;
  final Function onTapOption;

  const HomeAside({
    Key? key,
    this.accountType,
    required this.isActiveSemester,
    required this.onTapOption,
  }) : super(key: key);

  @override
  State<HomeAside> createState() => _HomeAsideState();
}

class _HomeAsideState extends State<HomeAside> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 40.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.03,
        ),
        color: OratioColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _setColumnList(widget.accountType),
        ),
      ),
    );
  }

  List<Widget> _setColumnList(AccountType? accountType) {
    switch (accountType) {
      case AccountType.teacher:
        return _optionsTeacher();
      case AccountType.student:
        return _optionsStudent();
      case AccountType.coordinator:
        return _optionsCoordinator();
      default:
        return _optionsStudent();
    }
  }

  List<Widget> _optionsTeacher() {
    return [
      TextButton(onPressed: () {}, child: Text('opção 1')),
      TextButton(onPressed: () {}, child: Text('opção 1')),
      TextButton(onPressed: () {}, child: Text('opção 1')),
      TextButton(onPressed: () {}, child: Text('opção 1')),
      TextButton(onPressed: () {}, child: Text('opção 1')),
    ];
  }

  List<Widget> _optionsStudent() {
    return [
      TextButton(onPressed: () {}, child: Text('opção 2')),
      TextButton(onPressed: () {}, child: Text('opção 2')),
      TextButton(onPressed: () {}, child: Text('opção 2')),
      TextButton(onPressed: () {}, child: Text('opção 2')),
      TextButton(onPressed: () {}, child: Text('opção 2')),
    ];
  }

  List<Widget> _optionsCoordinator() {
    return [
      if (!widget.isActiveSemester)
        AsideOptionButton(
          iconData: HomeOptions.openSemester.icon,
          text: HomeOptions.openSemester.name,
          onPressed: () => widget.onTapOption(HomeOptions.openSemester),
        )
      else
        AsideOptionButton(
          iconData: HomeOptions.closedSemester.icon,
          text: HomeOptions.closedSemester.name,
          onPressed: () => widget.onTapOption(HomeOptions.closedSemester),
        ),
      AsideOptionButton(
        iconData: HomeOptions.teachers.icon,
        text: HomeOptions.teachers.name,
        onPressed: () => widget.onTapOption(HomeOptions.teachers),
      ),
      AsideOptionButton(
        iconData: HomeOptions.students.icon,
        text: HomeOptions.students.name,
        onPressed: () => widget.onTapOption(HomeOptions.students),
      ),
      // AsideOptionButton(
      //   iconData: HomeOptions.calendar.icon,
      //   text: HomeOptions.calendar.name,
      //   onPressed: () => widget.onTapCalendar!(),
      // ),
      // AsideOptionButton(
      //   iconData: HomeOptions.attendances.icon,
      //   text: HomeOptions.attendances.name,
      //   onPressed: () => widget.onTapAttendances!(),
      // ),
      AsideOptionButton(
        iconData: HomeOptions.projects.icon,
        text: HomeOptions.projects.name,
        onPressed: () => widget.onTapOption(HomeOptions.projects),
      ),
      AsideOptionButton(
        iconData: HomeOptions.examinationBoard.icon,
        text: HomeOptions.examinationBoard.name,
        onPressed: () => widget.onTapOption(HomeOptions.examinationBoard),
      ),
      // AsideOptionButton(
      //   iconData: HomeOptions.results.icon,
      //   text: HomeOptions.results.name,
      //   onPressed: () => widget.onTapResults!(),
      // ),
    ];
  }
}
