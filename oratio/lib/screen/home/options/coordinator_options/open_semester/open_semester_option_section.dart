import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/screen/home/options/coordinator_options/coordinator_section_store.dart';
import 'package:oratio/screen/home/options/coordinator_options/open_semester/widgets/active_semester_alert.dart';
import 'package:oratio/screen/home/options/coordinator_options/open_semester/widgets/open_semester_card.dart';
import 'package:oratio/screen/home/widgets/circle_pending_load.dart';

class OpenSemesterOptionSection extends StatefulWidget {
  const OpenSemesterOptionSection({Key? key}) : super(key: key);

  @override
  State<OpenSemesterOptionSection> createState() =>
      _OpenSemesterOptionSectionState();
}

class _OpenSemesterOptionSectionState extends State<OpenSemesterOptionSection> {
  final store = CoordinatorSectionStore();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return SingleChildScrollView(
        child: Column(
          children: [
            if (store.isLoading)
              const Center(
                child: CirclePendingLoad(),
              ),
            if (store.isActiveSemester)
              const ActiveSemesterAlert()
            else
              OpenSemesterCard(
                initSemester: (Semester semester) =>
                    store.initSemester(semester),
              ),
          ],
        ),
      );
    });
  }
}
