// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:oratio/config/core/enums/account_type.dart';
import 'package:oratio/config/core/enums/home_options.dart';
import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/config/usecases/semester/get_semesters.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final _preferences = SharedPreferences.getInstance();
  final _getSemesters = GetSemesters();

  @observable
  bool isLoading = false;

  @observable
  AccountType? accountType;

  @observable
  Semester? activeSemester;

  @observable
  List<Teacher> teachers = [];

  @observable
  List<Semester> semesters = [];

  @observable
  HomeOptions homeOptions = HomeOptions.openSemester;

  @action
  Future<void> onInit() async {
    isLoading = true;

    await _setAccountType();
    await _setSemesters();

    if (activeSemester != null) {
      homeOptions = HomeOptions.students;
    } else {
      homeOptions = HomeOptions.openSemester;
    }

    isLoading = false;
  }

  Future<void> setHomeOptions(HomeOptions homeOptions) async {
    this.homeOptions = homeOptions;

    await _setSemesters();
  }

  @action
  Future<void> _setAccountType() async {
    final preferences = await _preferences;

    accountType = AccountType.values.firstWhere(
      (element) => element.toString() == preferences.getString('accountType'),
    );
  }

  Future<void> _setSemesters() async {
    semesters = await _getSemesters();

    if (semesters.isNotEmpty) {
      activeSemester =
          semesters.firstWhere((element) => element.status == 'ACTIVE');
    }
  }
}
