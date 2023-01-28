// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_RegisterStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_RegisterStoreBaseActionController =
      ActionController(name: '_RegisterStoreBase', context: context);

  @override
  Future<Result> register(
      {required String name, required String email, required String password}) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.register');
    try {
      return super.register(name: name, email: email, password: password);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
