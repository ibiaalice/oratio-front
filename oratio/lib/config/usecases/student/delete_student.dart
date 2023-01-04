import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/data/repositories/student_repository.dart';

class DeleteStudent {
  final StudentRepository _studentRepository = StudentRepository();
  DeleteStudent();

  Future<Result> call(Student student) async {
    final result = await _studentRepository.delete(student);

    if (result) {
      return Result(success: true, message: 'Aluno excluido com sucesso');
    } else {
      return Result(success: false, message: 'Falha ao excluir aluno');
    }
  }
}
