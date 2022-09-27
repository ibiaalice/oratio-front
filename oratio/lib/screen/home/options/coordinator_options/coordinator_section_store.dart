import 'package:mobx/mobx.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/config/usecases/project/add_evaluator.dart';
import 'package:oratio/config/usecases/project/get_projects.dart';
import 'package:oratio/config/usecases/student/get_students.dart';
import 'package:oratio/config/usecases/teacher/get_teachers.dart';
part 'coordinator_section_store.g.dart';

class CoordinatorSectionStore = _CoordinatorSectionStoreBase
    with _$CoordinatorSectionStore;

abstract class _CoordinatorSectionStoreBase with Store {
  final GetTeachers _getTeachers = GetTeachers();
  final GetStudents _getStudents = GetStudents();
  final GetProjects _getProjects = GetProjects();
  final AddEvaluator _addEvaluator = AddEvaluator();

  @observable
  bool isLoading = false;

  @observable
  List<Teacher> teachers = [];

  @observable
  int? selectedTeacherId;

  @observable
  List<Student> students = [];

  @observable
  List<Project> projects = [];

  @observable
  String? errorMessage = "";

  Future<void> onInit() async {
    await _setTeachers();
    await _setStudents();
    await _setProjects();
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

  Future<void> _setTeachers() async {
    isLoading = true;
    teachers = await _getTeachers();
    isLoading = false;
  }

  Future<void> _setStudents() async {
    isLoading = true;
    students = await _getStudents();
    isLoading = false;
  }

  Future<void> _setProjects() async {
    isLoading = true;
    projects = await _getProjects();
    isLoading = false;
  }

  Future<void> refresh() async {
    await _setTeachers();
    await _setStudents();
    await _setProjects();
  }

  Future<Result> addEvaluator(Project project, int teacherId) async {
    return await _addEvaluator(project, teacherId);
  }
}
