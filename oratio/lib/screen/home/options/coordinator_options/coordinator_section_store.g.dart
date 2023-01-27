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

  late final _$isActiveSemesterAtom = Atom(
      name: '_CoordinatorSectionStoreBase.isActiveSemester', context: context);

  @override
  bool get isActiveSemester {
    _$isActiveSemesterAtom.reportRead();
    return super.isActiveSemester;
  }

  @override
  set isActiveSemester(bool value) {
    _$isActiveSemesterAtom.reportWrite(value, super.isActiveSemester, () {
      super.isActiveSemester = value;
    });
  }

  late final _$studentSelectedAtom = Atom(
      name: '_CoordinatorSectionStoreBase.studentSelected', context: context);

  @override
  Student? get studentSelected {
    _$studentSelectedAtom.reportRead();
    return super.studentSelected;
  }

  @override
  set studentSelected(Student? value) {
    _$studentSelectedAtom.reportWrite(value, super.studentSelected, () {
      super.studentSelected = value;
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

  late final _$filterStudentAtom = Atom(
      name: '_CoordinatorSectionStoreBase.filterStudent', context: context);

  @override
  String? get filterStudent {
    _$filterStudentAtom.reportRead();
    return super.filterStudent;
  }

  @override
  set filterStudent(String? value) {
    _$filterStudentAtom.reportWrite(value, super.filterStudent, () {
      super.filterStudent = value;
    });
  }

  late final _$filterTeacherAtom = Atom(
      name: '_CoordinatorSectionStoreBase.filterTeacher', context: context);

  @override
  String? get filterTeacher {
    _$filterTeacherAtom.reportRead();
    return super.filterTeacher;
  }

  @override
  set filterTeacher(String? value) {
    _$filterTeacherAtom.reportWrite(value, super.filterTeacher, () {
      super.filterTeacher = value;
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

  late final _$semestersAtom =
      Atom(name: '_CoordinatorSectionStoreBase.semesters', context: context);

  @override
  List<Semester> get semesters {
    _$semestersAtom.reportRead();
    return super.semesters;
  }

  @override
  set semesters(List<Semester> value) {
    _$semestersAtom.reportWrite(value, super.semesters, () {
      super.semesters = value;
    });
  }

  late final _$semesterSelectedAtom = Atom(
      name: '_CoordinatorSectionStoreBase.semesterSelected', context: context);

  @override
  Semester? get semesterSelected {
    _$semesterSelectedAtom.reportRead();
    return super.semesterSelected;
  }

  @override
  set semesterSelected(Semester? value) {
    _$semesterSelectedAtom.reportWrite(value, super.semesterSelected, () {
      super.semesterSelected = value;
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

  late final _$editStudentAsyncAction =
      AsyncAction('_CoordinatorSectionStoreBase.editStudent', context: context);

  @override
  Future<Result> editStudent(Student student) {
    return _$editStudentAsyncAction.run(() => super.editStudent(student));
  }

  late final _$addStudentBySpreedsheetAsyncAction = AsyncAction(
      '_CoordinatorSectionStoreBase.addStudentBySpreedsheet',
      context: context);

  @override
  Future<Result> addStudentBySpreedsheet(String spreadsheet) {
    return _$addStudentBySpreedsheetAsyncAction
        .run(() => super.addStudentBySpreedsheet(spreadsheet));
  }

  late final _$addTeacherBySpreedsheetAsyncAction = AsyncAction(
      '_CoordinatorSectionStoreBase.addTeacherBySpreedsheet',
      context: context);

  @override
  Future<Result> addTeacherBySpreedsheet(String spreadsheet) {
    return _$addTeacherBySpreedsheetAsyncAction
        .run(() => super.addTeacherBySpreedsheet(spreadsheet));
  }

  late final _$_CoordinatorSectionStoreBaseActionController =
      ActionController(name: '_CoordinatorSectionStoreBase', context: context);

  @override
  void setStudentSelected(Student student) {
    final _$actionInfo = _$_CoordinatorSectionStoreBaseActionController
        .startAction(name: '_CoordinatorSectionStoreBase.setStudentSelected');
    try {
      return super.setStudentSelected(student);
    } finally {
      _$_CoordinatorSectionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterStudent(String value) {
    final _$actionInfo = _$_CoordinatorSectionStoreBaseActionController
        .startAction(name: '_CoordinatorSectionStoreBase.setFilterStudent');
    try {
      return super.setFilterStudent(value);
    } finally {
      _$_CoordinatorSectionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterTeacher(String value) {
    final _$actionInfo = _$_CoordinatorSectionStoreBaseActionController
        .startAction(name: '_CoordinatorSectionStoreBase.setFilterTeacher');
    try {
      return super.setFilterTeacher(value);
    } finally {
      _$_CoordinatorSectionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
isActiveSemester: ${isActiveSemester},
studentSelected: ${studentSelected},
teachers: ${teachers},
students: ${students},
filterStudent: ${filterStudent},
filterTeacher: ${filterTeacher},
projects: ${projects},
semesters: ${semesters},
semesterSelected: ${semesterSelected},
errorMessage: ${errorMessage}
    ''';
  }
}
