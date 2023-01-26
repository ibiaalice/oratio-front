// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_options_section_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectsOptionsSectionStore on _ProjectsOptionsSectionStoreBase, Store {
  late final _$isLoadingAtom = Atom(
      name: '_ProjectsOptionsSectionStoreBase.isLoading', context: context);

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

  late final _$projectsAtom =
      Atom(name: '_ProjectsOptionsSectionStoreBase.projects', context: context);

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

  late final _$studentsAtom =
      Atom(name: '_ProjectsOptionsSectionStoreBase.students', context: context);

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

  late final _$teachersAtom =
      Atom(name: '_ProjectsOptionsSectionStoreBase.teachers', context: context);

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

  late final _$onInitAsyncAction =
      AsyncAction('_ProjectsOptionsSectionStoreBase.onInit', context: context);

  @override
  Future<void> onInit() {
    return _$onInitAsyncAction.run(() => super.onInit());
  }

  late final _$editProjectAsyncAction = AsyncAction(
      '_ProjectsOptionsSectionStoreBase.editProject',
      context: context);

  @override
  Future<Result> editProject(Project project) {
    return _$editProjectAsyncAction.run(() => super.editProject(project));
  }

  late final _$addEvaluatorAsyncAction = AsyncAction(
      '_ProjectsOptionsSectionStoreBase.addEvaluator',
      context: context);

  @override
  Future<Result> addEvaluator(Teacher teacher, Project project) {
    return _$addEvaluatorAsyncAction
        .run(() => super.addEvaluator(teacher, project));
  }

  late final _$deleteProjectAsyncAction = AsyncAction(
      '_ProjectsOptionsSectionStoreBase.deleteProject',
      context: context);

  @override
  Future<Result> deleteProject(Project project) {
    return _$deleteProjectAsyncAction.run(() => super.deleteProject(project));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
projects: ${projects},
students: ${students},
teachers: ${teachers}
    ''';
  }
}
