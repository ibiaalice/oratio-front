import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/data/repositories/student_repository.dart';

class AddStudent {
  final StudentRepository repository = StudentRepository();

  Future<Result> call(Student student) async {
    final result = await repository.addStudent(student);

    if (result) {
      return Result(success: true, message: 'Student added successfully');
    } else {
      return Result(success: false, message: 'Failed to add student');
    }
  }
}
