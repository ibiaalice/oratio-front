// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/config/usecases/project/add_evaluator.dart';
import 'package:oratio/config/usecases/project/delete_project.dart';
import 'package:oratio/config/usecases/project/edit_project.dart';
import 'package:oratio/config/usecases/project/get_projects.dart';
import 'package:oratio/config/usecases/student/get_students.dart';
import 'package:oratio/config/usecases/teacher/get_teachers.dart';
part 'projects_options_section_store.g.dart';

class ProjectsOptionsSectionStore = _ProjectsOptionsSectionStoreBase
    with _$ProjectsOptionsSectionStore;

abstract class _ProjectsOptionsSectionStoreBase with Store {
  final GetProjects _getProjects = GetProjects();
  final GetStudents _getStudents = GetStudents();
  final GetTeachers _getTeachers = GetTeachers();

  final EditProject _editProject = EditProject();
  final AddEvaluator _addEvaluator = AddEvaluator();
  final DeleteProject _deleteProject = DeleteProject();

  @observable
  bool isLoading = false;

  @observable
  String search = '';

  @observable
  List<Project> projects = [];

  @observable
  List<Student> students = [];

  @observable
  List<Teacher> teachers = [];

  @observable
  Student? selectedStudent;

  @action
  Future<void> onInit() async {
    await _setProjects();
    await _setStudents();
    await _setTeachers();
  }

  @action
  void setSelectedStudent(Student? student) {
    isLoading = true;
    selectedStudent = student;
    isLoading = false;
  }

  @action
  void onSearch(String value) {
    isLoading = true;
    search = value;
    isLoading = false;
  }

  List<Project> get filteredProjects {
    if (search.isEmpty) return projects;

    return projects
        .where((project) =>
            project.title.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  Teacher getTeacherById(int id) {
    return teachers.firstWhere((teacher) => teacher.id == id);
  }

  Student getStudentById(int id) {
    return students.firstWhere((student) => student.id == id);
  }

  @action
  Future<Result> editProject(Project project) async {
    isLoading = true;
    final result = await _editProject(project);
    await _setProjects();
    isLoading = false;

    return result;
  }

  @action
  Future<Result> addEvaluator(Teacher teacher, Project project) async {
    isLoading = true;

    final result = await _addEvaluator(project, teacher.id!);
    await _setProjects();
    isLoading = false;

    return result;
  }

  @action
  Future<Result> deleteProject(Project project) async {
    isLoading = true;
    final result = await _deleteProject(project);
    await _setProjects();
    isLoading = false;

    return result;
  }

  //Auxiliars methods

  Future<void> _setStudents() async {
    isLoading = true;
    students = await _getStudents();
    isLoading = false;
  }

  Future<void> _setTeachers() async {
    isLoading = true;
    teachers = await _getTeachers();
    isLoading = false;
  }

  Future<void> _setProjects() async {
    isLoading = true;
    projects = await _getProjects();
    isLoading = false;
  }
}
