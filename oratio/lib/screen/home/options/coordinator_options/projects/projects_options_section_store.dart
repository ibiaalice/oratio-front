// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/config/entities/teacher.dart';
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

  @observable
  bool isLoading = false;

  @observable
  List<Project> projects = [];

  @observable
  List<Student> students = [];

  @observable
  List<Teacher> teachers = [];

  @action
  Future<void> onInit() async {
    await _setProjects();
    await _setStudents();
    await _setTeachers();
  }

  Teacher getTeacherById(int id) {
    return teachers.firstWhere((teacher) => teacher.id == id);
  }

  Student getStudentById(int id) {
    return students.firstWhere((student) => student.id == id);
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
