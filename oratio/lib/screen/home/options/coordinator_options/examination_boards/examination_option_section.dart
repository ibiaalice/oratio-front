import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/screen/home/options/coordinator_options/coordinator_section_store.dart';
import 'package:oratio/screen/home/widgets/circle_pending_load.dart';
import 'package:oratio/utils/widgets/semester_aside_drop_button.dart';

class ExaminationOptionSection extends StatefulWidget {
  const ExaminationOptionSection({
    super.key,
  });

  @override
  State<ExaminationOptionSection> createState() =>
      _ExaminationOptionSectionState();
}

class _ExaminationOptionSectionState extends State<ExaminationOptionSection> {
  final store = CoordinatorSectionStore();

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
      return SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SemesterAsideDropButton(
              semesterSelected: store.semesterSelected,
              semesters: store.semesters,
              onTapSemester: (Semester semester) =>
                  store.selectSemester(semester),
            ),
          ],
        ),
      );
    });
  }
}
