// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:oratio/config/core/enums/account_type.dart';
import 'package:oratio/config/entities/user.dart';
import 'package:oratio/config/usecases/user/login_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final LoginUser _loginUser = LoginUser();
  final _preferences = SharedPreferences.getInstance();

  @observable
  AccountType accountType = AccountType.coordinator;

  @action
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final encodedPassword = base64Encode(utf8.encode(password));

    final user = User(
      email: email,
      password: encodedPassword,
    );

    final result = await _loginUser(user);

    if (result) {
      await saveAccountType();
    }

    return result;
  }

  @action
  void changeAccountType(AccountType type) {
    accountType = type;
  }

  Future<void> saveAccountType() async {
    final preferences = await _preferences;
    preferences.setString('accountType', accountType.toString());
  }
}
