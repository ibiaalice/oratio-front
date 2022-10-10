import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/screen/home/options/coordinator_options/coordinator_section_store.dart';
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
      return Expanded(
        child: SingleChildScrollView(
          child: Container(
            color: OratioColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [],
            ),
          ),
        ),
      );
    });
  }
}
