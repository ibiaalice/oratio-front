import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/data/repositories/student_repository.dart';

class EditStudent {
  final StudentRepository _studentRepository = StudentRepository();
  EditStudent();

  Future<Result> call(Student student) async {
    final result = await _studentRepository.editStudent(student);

    if (result) {
      return Result(
        message: 'Estudante editado com sucesso!',
        success: true,
      );
    } else {
      return Result(
        message: 'Erro ao editar estudante',
        success: false,
      );
    }
  }
}
