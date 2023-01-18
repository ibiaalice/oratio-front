// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentProfileStore on _StudentProfileBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_StudentProfileBase.isLoading', context: context);

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

  late final _$studentAtom =
      Atom(name: '_StudentProfileBase.student', context: context);

  @override
  Student? get student {
    _$studentAtom.reportRead();
    return super.student;
  }

  @override
  set student(Student? value) {
    _$studentAtom.reportWrite(value, super.student, () {
      super.student = value;
    });
  }

  late final _$projectAtom =
      Atom(name: '_StudentProfileBase.project', context: context);

  @override
  Project? get project {
    _$projectAtom.reportRead();
    return super.project;
  }

  @override
  set project(Project? value) {
    _$projectAtom.reportWrite(value, super.project, () {
      super.project = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
student: ${student},
project: ${project}
    ''';
  }
}
