import 'package:mobx/mobx.dart';
import 'package:oratio/config/core/enums/account_type.dart';
import 'package:oratio/config/core/enums/home_options.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/config/usecases/teacher/get_teachers.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final _preferences = SharedPreferences.getInstance();
  final _getTeachers = GetTeachers();

  @observable
  bool isLoading = false;

  @observable
  AccountType? accountType;

  @observable
  List<Teacher> teachers = [];

  @observable
  HomeOptions homeOptions = HomeOptions.examinationBoard;

  @action
  Future<void> onInit() async {
    await _setAccountType();
    await _setTeachers();
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
}
