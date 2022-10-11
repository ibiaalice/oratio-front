import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/config/core/enums/home_options.dart';
import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/screen/home/home_store.dart';
import 'package:oratio/screen/home/options/home_options_page.dart';
import 'package:oratio/screen/home/widgets/circle_pending_load.dart';
import 'package:oratio/screen/home/widgets/home_aside/home_aside.dart';
import 'package:oratio/utils/style/oratio_colors.dart';
import 'package:oratio/utils/style/oratio_icons.dart';
import 'package:oratio/utils/widgets/animated_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = HomeStore();

  @override
  void initState() {
    super.initState();
    store.onInit();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenSize.height * 0.2,
        automaticallyImplyLeading: false,
        title: Observer(
          builder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AnimatedLogo().little(context),
              _optionsTitle(),
            ],
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: OratioColors.background,
        actions: [_exitButton()],
      ),
      backgroundColor: OratioColors.background,
      body: Observer(
        builder: (context) {
          if (store.isLoading) {
            return const Center(
              child: CirclePendingLoad(),
            );
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(builder: (context) {
                return HomeAside(
                  accountType: store.accountType,
                  onTapOpenSemester: () {
                    log('onTapOpenSemester');
                    store.setHomeOptions(HomeOptions.openSemester);
                  },
                  onTapTeachers: () {
                    log('onTapTeachers');
                    store.setHomeOptions(HomeOptions.teachers);
                  },
                  onTapStudents: () {
                    log('onTapStudents');
                    store.setHomeOptions(HomeOptions.students);
                  },
                  onTapCalendar: () {
                    store.setHomeOptions(HomeOptions.calendar);
                  },
                  onTapAttendances: () {
                    store.setHomeOptions(HomeOptions.attendances);
                  },
                  onTapProjects: () {
                    store.setHomeOptions(HomeOptions.projects);
                  },
                  onTapExaminationBoard: () {
                    store.setHomeOptions(HomeOptions.examinationBoard);
                  },
                  onTapResults: () {
                    store.setHomeOptions(HomeOptions.results);
                  },
                );
              }),
              Expanded(
                child: HomeOptionsPage(
                  homeOptions: store.homeOptions,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _optionsTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Container(
        alignment: Alignment.topLeft,
        child: Text(
          store.homeOptions.name,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget _exitButton() {
    return IconButton(
      icon: const Icon(
        OratioIcons.exit,
        color: OratioColors.darkGrey,
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
    );
  }
}
