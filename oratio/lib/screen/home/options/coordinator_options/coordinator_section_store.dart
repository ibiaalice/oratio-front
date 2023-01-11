import 'package:mobx/mobx.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/config/usecases/project/add_evaluator.dart';
import 'package:oratio/config/usecases/project/get_projects.dart';
import 'package:oratio/config/usecases/semester/get_semesters.dart';
import 'package:oratio/config/usecases/semester/init_semester.dart';
import 'package:oratio/config/usecases/student/add_student.dart';
import 'package:oratio/config/usecases/student/delete_student.dart';
import 'package:oratio/config/usecases/student/get_students.dart';
import 'package:oratio/config/usecases/teacher/create_teacher.dart';
import 'package:oratio/config/usecases/teacher/delete_teacher.dart';
import 'package:oratio/config/usecases/teacher/get_teachers.dart';
part 'coordinator_section_store.g.dart';

class CoordinatorSectionStore = _CoordinatorSectionStoreBase
    with _$CoordinatorSectionStore;

abstract class _CoordinatorSectionStoreBase with Store {
  final GetTeachers _getTeachers = GetTeachers();
  final GetStudents _getStudents = GetStudents();
  final GetProjects _getProjects = GetProjects();
  final AddEvaluator _addEvaluator = AddEvaluator();
  final AddStudent _addStudent = AddStudent();
  final DeleteStudent _deleteStudent = DeleteStudent();
  final GetSemesters _getSemesters = GetSemesters();

  final AddTeacher _addTeacher = AddTeacher();
  final DeleteTeacher _deleteTeacher = DeleteTeacher();

  final InitSemester _initSemester = InitSemester();

  @observable
  bool isLoading = false;

  @observable
  bool isActiveSemester = false;

  @observable
  List<Teacher> teachers = [];

  @observable
  List<Student> students = [];

  @observable
  List<Project> projects = [];

  @observable
  List<Semester> semesters = [];

  @observable
  Semester? semesterSelected;

  @observable
  String? errorMessage = "";

  Future<void> onInit() async {
    await _setTeachers();
    await _setStudents();
    await _setSemesters();
    await _setProjects();

    if (semesters.isNotEmpty) {
      semesterSelected = semesters.firstWhere(
        (semester) => semester.status == 'active',
        orElse: () => semesters.first,
      );

      isActiveSemester = semesterSelected!.status! == 'active';
    }
  }

  @action
  Teacher? getTeacher(int? teacherId) {
    if (teacherId == null) return null;

    return teachers.firstWhere((teacher) => teacher.id == teacherId);
  }

  Student getStudent(int studentId) {
    return students.firstWhere((student) => student.id == studentId);
  }

//aux method's

  Future<void> _setSemesters() async {
    isLoading = true;
    semesters = await _getSemesters();
    isLoading = false;
  }

  Future<void> _setTeachers() async {
    isLoading = true;
    teachers = await _getTeachers();
    isLoading = false;
  }

  Future<void> _setStudents() async {
    isLoading = true;
    final newStudents = await _getStudents();
    students = newStudents;
    isLoading = false;
  }

  Future<void> selectSemester(Semester semester) async {
    isLoading = true;
    semesterSelected = semester;
    await refresh();
    isLoading = false;
  }

  Future<void> _setProjects() async {
    if (semesterSelected == null) {
      isLoading = true;
      projects = await _getProjects();
      isLoading = false;
    } else {
      isLoading = true;
      projects = await _getProjects();
      isLoading = false;
    }
  }

  Future<void> refresh() async {
    await _setTeachers();
    await _setStudents();
    await _setProjects();
  }

  Future<Result> addEvaluator(Project project, int teacherId) async {
    return await _addEvaluator(project, teacherId);
  }

  Future<Result> addEvaluator2(Project project, int teacherId) async {
    return await _addEvaluator.addEvaluator2(project, teacherId);
  }

  Future<Result> addStudent(Student student) async {
    final Result result = await _addStudent(student);
    await _setStudents();

    return result;
  }

  Future<Result> deleteStudent(Student student) async {
    final Result result = await _deleteStudent(student);
    await _setStudents();

    return result;
  }

  Future<Result> addTeacher(Teacher teacher) async {
    final Result result = await _addTeacher(teacher);

    await _setTeachers();

    return result;
  }

  Future<Result> deleteTeacher(Teacher teacher) async {
    final Result result = await _deleteTeacher(teacher);

    await _setTeachers();

    return result;
  }

  Future editProject(Project project) async {
    // await _getProjects.editProject(project);
    await refresh();
  }

  Future deleteProject(Project project) async {
    // await _getProjects.deleteProject(project);
    await refresh();
  }

  Future<Result> initSemester(Semester semester) async {
    final result = await _initSemester(semester);
    if (result.success) isActiveSemester = true;

    return result;
  }
}
