// ignore_for_file: library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/config/usecases/project/add_evaluator.dart';
import 'package:oratio/config/usecases/project/get_projects.dart';
import 'package:oratio/config/usecases/semester/close_semester.dart';
import 'package:oratio/config/usecases/semester/get_active_semester.dart';
import 'package:oratio/config/usecases/semester/get_semesters.dart';
import 'package:oratio/config/usecases/semester/init_semester.dart';
import 'package:oratio/config/usecases/student/add_student.dart';
import 'package:oratio/config/usecases/student/delete_student.dart';
import 'package:oratio/config/usecases/student/edit_student.dart';
import 'package:oratio/config/usecases/student/get_students.dart';
import 'package:oratio/config/usecases/teacher/create_teacher.dart';
import 'package:oratio/config/usecases/teacher/delete_teacher.dart';
import 'package:oratio/config/usecases/teacher/get_teachers.dart';
import 'package:oratio/data/services/g_sheets_services.dart';
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
  final GetActiveSemester _getActiveSemester = GetActiveSemester();
  final EditStudent _editStudent = EditStudent();

  final AddTeacher _addTeacher = AddTeacher();
  final DeleteTeacher _deleteTeacher = DeleteTeacher();

  final InitSemester _initSemester = InitSemester();
  final CloseSemester _closeSemester = CloseSemester();

  final GSheetsServices _gSheetsServices = GSheetsServices();

  @observable
  bool isLoading = false;

  @observable
  bool isActiveSemester = false;

  @observable
  Student? studentSelected;

  @observable
  List<Teacher> teachers = [];

  @observable
  List<Student> students = [];

  @observable
  String? filterStudent = "";

  @observable
  String? filterTeacher = "";

  @observable
  List<Project> projects = [];

  @observable
  List<Semester> semesters = [];

  @observable
  Semester? semesterSelected;

  @observable
  String? errorMessage = "";

  Future<void> onInit() async {
    await _setActiveSemester();
    await _setTeachers();
    await _setStudents();
    await _setSemesters();
    await _setProjects();
  }

  List<Student> get filteredStudents {
    if (filterStudent == null || filterStudent!.isEmpty) {
      return students;
    }

    return students
        .where((student) =>
            student.name.toLowerCase().contains(filterStudent!.toLowerCase()))
        .toList();
  }

  List<Teacher> get filteredTeachers {
    if (filterTeacher == null || filterTeacher!.isEmpty) {
      return teachers;
    }

    return teachers
        .where((teacher) =>
            teacher.name.toLowerCase().contains(filterTeacher!.toLowerCase()))
        .toList();
  }

  @action
  void setStudentSelected(Student student) {
    isLoading = true;
    studentSelected = student;
    isLoading = false;
  }

  @action
  void setFilterStudent(String value) {
    isLoading = true;
    filterStudent = value;
    isLoading = false;
  }

  @action
  Future<Result> editStudent(Student student) async {
    isLoading = true;
    final result = await _editStudent(student);
    await _setStudents();
    isLoading = false;

    return result;
  }

  @action
  void setFilterTeacher(String value) {
    isLoading = true;
    filterTeacher = value;
    isLoading = false;
  }

  @action
  Teacher? getTeacher(int? teacherId) {
    if (teacherId == null) return null;

    return teachers.firstWhere((teacher) => teacher.id == teacherId);
  }

  Student getStudent(int studentId) {
    return students.firstWhere((student) => student.id == studentId);
  }

  @action
  Future<Result> addStudentBySpreedsheet(String spreadsheet) async {
    final spreadsheetParts = spreadsheet.split("/");

    final spreadsheetId = spreadsheetParts[5];
    isLoading = true;

    final result =
        await _gSheetsServices.addStudentBySpreedsheet(spreadsheetId);
    await _setStudents();
    isLoading = false;

    return result;
  }

  @action
  Future<Result> addTeacherBySpreedsheet(String spreadsheet) async {
    final spreadsheetParts = spreadsheet.split("/");

    final spreadsheetId = spreadsheetParts[5];
    isLoading = true;

    final result =
        await _gSheetsServices.addTeacherBySpreedsheet(spreadsheetId);
    await _setTeachers();
    isLoading = false;

    return result;
  }

//aux method's

  Future<void> _setActiveSemester() async {
    isLoading = true;
    final activeSemester = await _getActiveSemester();

    if (activeSemester != null) {
      semesterSelected = activeSemester;
      isActiveSemester = true;
    } else {
      isActiveSemester = false;
    }
    isLoading = false;
  }

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

  Future<Result> initSemester(Semester semester) async {
    final result = await _initSemester(semester);
    if (result.success) isActiveSemester = true;

    return result;
  }

  Future<Result> closeSemester() async {
    isLoading = true;
    final activeSemester = await _getActiveSemester();

    if (activeSemester != null) {
      final result = await _closeSemester(activeSemester);
      if (result.success) isActiveSemester = false;
      isLoading = false;

      return result;
    }
    isLoading = false;

    return Result(success: false, message: 'Semestre não encontrado');
  }
}
