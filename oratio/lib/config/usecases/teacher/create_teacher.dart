import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/data/repositories/teacher_repository.dart';

class AddTeacher {
  final TeacherRepository _teacherRepository = TeacherRepository();
  AddTeacher();

  Future<Result> call(Teacher teacher) async {
    final result = await _teacherRepository.addTeacher(teacher);

    if (result) {
      return Result(
        message: 'Professor cadastrado com sucesso',
        success: true,
      );
    } else {
      return Result(
        message: 'Erro ao cadastrar professor',
        success: false,
      );
    }
  }
}
