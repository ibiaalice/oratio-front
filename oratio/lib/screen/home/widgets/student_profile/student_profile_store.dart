// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:oratio/config/entities/accompaniments.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/config/usecases/accompaniments/add_accompaniments.dart';
import 'package:oratio/config/usecases/accompaniments/delete_accompaniments.dart';
import 'package:oratio/config/usecases/accompaniments/get_accompaniments.dart';
import 'package:oratio/config/usecases/project/add_evaluator.dart';
import 'package:oratio/config/usecases/project/add_project.dart';
import 'package:oratio/config/usecases/project/delete_project.dart';
import 'package:oratio/config/usecases/project/edit_project.dart';
import 'package:oratio/config/usecases/project/get_project_by_student_id.dart';
import 'package:oratio/config/usecases/teacher/get_teachers.dart';
part 'student_profile_store.g.dart';

class StudentProfileStore = _StudentProfileBase with _$StudentProfileStore;

abstract class _StudentProfileBase with Store {
  final GetProjectByStudentId _getProjectByStudentId = GetProjectByStudentId();
  final GetAccompaniments _getAccompaniments = GetAccompaniments();
  final GetTeachers _getTeachers = GetTeachers();
  final DeleteAccompaniments _deleteAccompaniments = DeleteAccompaniments();
  final DeleteProject _deleteProject = DeleteProject();
  final AddProject _addProject = AddProject();
  final AddAccompaniments _addAccompaniments = AddAccompaniments();
  final AddEvaluator _addEvaluator = AddEvaluator();
  final EditProject _editProject = EditProject();

  @observable
  bool isLoading = false;

  @observable
  Student? student;

  @observable
  Project? project;

  @observable
  List<Teacher> teachers = [];

  @observable
  List<Accompaniments> accompaniments = [];

  Future<void> onInit(Student student) async {
    isLoading = true;
    this.student = student;

    await _setProject();
    await _setAccompaniments();
    await _setTeachers();

    isLoading = false;
  }

  @action
  Future<void> _setProject() async {
    isLoading = true;
    project = await _getProjectByStudentId(student!.id!);
    isLoading = false;
  }

  @action
  Future<void> _setAccompaniments() async {
    isLoading = true;
    accompaniments = await _getAccompaniments.byStudentId(student!.id!);
    isLoading = false;
  }

  @action
  Future<void> _setTeachers() async {
    isLoading = true;
    teachers = await _getTeachers();
    isLoading = false;
  }

  @action
  Future<Result> deleteAccompaniments(Accompaniments accompaniments) async {
    isLoading = true;
    final result = await _deleteAccompaniments(accompaniments);
    await _setAccompaniments();
    isLoading = false;

    return result;
  }

  @action
  Future<Result> deleteProject() async {
    isLoading = true;
    final result = await _deleteProject(project!);
    if (result.success) project = null;
    isLoading = false;

    return result;
  }

  @action
  Future<Result> addProject(Project project) async {
    isLoading = true;
    final result = await _addProject(project);
    await _setProject();
    isLoading = false;

    return result;
  }

  @action
  Future<Result> editProject(Project project) async {
    isLoading = true;
    final result = await _editProject(project);
    await _setProject();
    isLoading = false;

    return result;
  }

  @action
  Teacher getTeacherById(int id) {
    return teachers.firstWhere((teacher) => teacher.id == id);
  }

  @action
  Future<Result> addAccompaniments(Accompaniments accompaniments) async {
    isLoading = true;
    final result = await _addAccompaniments(accompaniments);
    await _setAccompaniments();
    isLoading = false;

    return result;
  }

  @action
  Future<Result> addEvaluator(Teacher teacher) async {
    isLoading = true;

    final result = await _addEvaluator(project!, teacher.id!);
    await _setProject();
    isLoading = false;

    return result;
  }
}
