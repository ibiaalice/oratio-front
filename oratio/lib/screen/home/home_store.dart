import 'package:mobx/mobx.dart';
import 'package:oratio/config/core/enums/account_type.dart';
import 'package:oratio/config/core/enums/home_options.dart';
import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/config/usecases/semester/get_semesters.dart';
import 'package:oratio/config/usecases/teacher/get_teachers.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final _preferences = SharedPreferences.getInstance();
  final _getTeachers = GetTeachers();
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
    await _setAccountType();
    await _setTeachers();
    await _setSemesters();

    if (activeSemester != null) {
      homeOptions = HomeOptions.students;
    } else {
      homeOptions = HomeOptions.openSemester;
    }
  }

  void setHomeOptions(HomeOptions homeOptions) {
    this.homeOptions = homeOptions;
  }

  @action
  Future<void> _setAccountType() async {
    final preferences = await _preferences;

    accountType = AccountType.values.firstWhere(
      (element) => element.toString() == preferences.getString('accountType'),
    );
  }

  Future<void> _setTeachers() async {
    isLoading = true;

    teachers = await _getTeachers();

    isLoading = false;
  }

  Future<void> _setSemesters() async {
    isLoading = true;
    semesters = await _getSemesters();

    if (semesters.isNotEmpty) {
      activeSemester =
          semesters.firstWhere((element) => element.status == 'ACTIVE');
    }

    isLoading = false;
  }
}
