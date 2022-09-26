import 'package:oratio/config/entities/student.dart';
import 'package:oratio/data/repositories/student_repository.dart';

class GetStudents {
  final StudentRepository repository = StudentRepository();

  GetStudents();

  Future<List<Student>> call() async {
    final response = await repository.getStudents();

    return response.map((student) => Student.fromJson(student)).toList();
  }
}
