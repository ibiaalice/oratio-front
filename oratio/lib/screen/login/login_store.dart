import 'package:mobx/mobx.dart';
import 'package:oratio/config/core/enums/account_type.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final _preferences = SharedPreferences.getInstance();
  @observable
  AccountType accountType = AccountType.student;

  @action
  void changeAccountType(AccountType type) {
    accountType = type;
  }

  Future<void> saveAccountType() async {
    final preferences = await _preferences;
    preferences.setString('accountType', accountType.toString());
  }
}
