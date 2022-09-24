import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/data/repositories/teacher_repository.dart';

class GetTeachers {
  final TeacherRepository _teacherRepository = TeacherRepository();

  Future<List<Teacher>> call() async {
    final response = await _teacherRepository.getTeachers();

    return response.map((teacher) => Teacher.fromJson(teacher)).toList();
  }
}
