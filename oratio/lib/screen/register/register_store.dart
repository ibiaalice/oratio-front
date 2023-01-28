// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/user.dart';
import 'package:oratio/config/usecases/user/register_user.dart';
import 'dart:convert';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final RegisterUser _registerUser = RegisterUser();

  @observable
  bool isLoading = false;

  @action
  Future<Result> register({
    required String name,
    required String email,
    required String password,
  }) {
    isLoading = true;

    final encodedPassword = base64Encode(utf8.encode(password));
    log('password: $password, encodedPassword: $encodedPassword');

    final user = User(
      name: name,
      email: email,
      password: encodedPassword,
    );

    final result = _registerUser(user);
    isLoading = false;
    return result;
  }
}
