// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinator_section_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CoordinatorSectionStore on _CoordinatorSectionStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CoordinatorSectionStoreBase.isLoading', context: context);

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

  late final _$teachersAtom =
      Atom(name: '_CoordinatorSectionStoreBase.teachers', context: context);

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

  late final _$selectedTeacherIdAtom = Atom(
      name: '_CoordinatorSectionStoreBase.selectedTeacherId', context: context);

  @override
  int? get selectedTeacherId {
    _$selectedTeacherIdAtom.reportRead();
    return super.selectedTeacherId;
  }

  @override
  set selectedTeacherId(int? value) {
    _$selectedTeacherIdAtom.reportWrite(value, super.selectedTeacherId, () {
      super.selectedTeacherId = value;
    });
  }

  late final _$studentsAtom =
      Atom(name: '_CoordinatorSectionStoreBase.students', context: context);

  @override
  List<Student> get students {
    _$studentsAtom.reportRead();
    return super.students;
  }

  @override
  set students(List<Student> value) {
    _$studentsAtom.reportWrite(value, super.students, () {
      super.students = value;
    });
  }

  late final _$projectsAtom =
      Atom(name: '_CoordinatorSectionStoreBase.projects', context: context);

  @override
  List<Project> get projects {
    _$projectsAtom.reportRead();
    return super.projects;
  }

  @override
  set projects(List<Project> value) {
    _$projectsAtom.reportWrite(value, super.projects, () {
      super.projects = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CoordinatorSectionStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$_CoordinatorSectionStoreBaseActionController =
      ActionController(name: '_CoordinatorSectionStoreBase', context: context);

  @override
  Teacher? getTeacher(int? teacherId) {
    final _$actionInfo = _$_CoordinatorSectionStoreBaseActionController
        .startAction(name: '_CoordinatorSectionStoreBase.getTeacher');
    try {
      return super.getTeacher(teacherId);
    } finally {
      _$_CoordinatorSectionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
teachers: ${teachers},
selectedTeacherId: ${selectedTeacherId},
students: ${students},
projects: ${projects},
errorMessage: ${errorMessage}
    ''';
  }
}
