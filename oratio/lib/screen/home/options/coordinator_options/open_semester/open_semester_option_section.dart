import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/screen/home/options/coordinator_options/coordinator_section_store.dart';
import 'package:oratio/screen/home/widgets/circle_pending_load.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

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
    final screenSize = MediaQuery.of(context).size;

    return Observer(builder: (context) {
      return Observer(builder: (context) {
        if (store.isLoading) return const CirclePendingLoad();
        return Container(
          padding: const EdgeInsets.only(right: 40),
          child: Column(
            children: [
              // _studentsListOptions(),
              Expanded(
                child: ListView(
                  children: [
                    // for (final student in store.students) _studentTile(student),
                  ],
                ),
              )
            ],
          ),
        );
      });
    });
  }
}
