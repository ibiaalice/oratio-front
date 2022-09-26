// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomeStoreBase.isLoading', context: context);

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

  late final _$accountTypeAtom =
      Atom(name: '_HomeStoreBase.accountType', context: context);

  @override
  AccountType? get accountType {
    _$accountTypeAtom.reportRead();
    return super.accountType;
  }

  @override
  set accountType(AccountType? value) {
    _$accountTypeAtom.reportWrite(value, super.accountType, () {
      super.accountType = value;
    });
  }

  late final _$teachersAtom =
      Atom(name: '_HomeStoreBase.teachers', context: context);

  @override
  List<Teacher> get teachers {
    _$teachersAtom.reportRead();
    return super.teachers;
  }

  @override
  set teachers(List<Teacher> value) {
    _$teachersAtom.reportWrite(value, super.teachers, () {
      super.teachers = value;
    });
  }

  late final _$homeOptionsAtom =
      Atom(name: '_HomeStoreBase.homeOptions', context: context);

  @override
  HomeOptions get homeOptions {
    _$homeOptionsAtom.reportRead();
    return super.homeOptions;
  }

  @override
  set homeOptions(HomeOptions value) {
    _$homeOptionsAtom.reportWrite(value, super.homeOptions, () {
      super.homeOptions = value;
    });
  }

  late final _$onInitAsyncAction =
      AsyncAction('_HomeStoreBase.onInit', context: context);

  @override
  Future<void> onInit() {
    return _$onInitAsyncAction.run(() => super.onInit());
  }

  late final _$_setAccountTypeAsyncAction =
      AsyncAction('_HomeStoreBase._setAccountType', context: context);

  @override
  Future<void> _setAccountType() {
    return _$_setAccountTypeAsyncAction.run(() => super._setAccountType());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
accountType: ${accountType},
teachers: ${teachers},
homeOptions: ${homeOptions}
    ''';
  }
}
