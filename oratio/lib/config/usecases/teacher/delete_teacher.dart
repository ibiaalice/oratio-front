import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/data/repositories/teacher_repository.dart';

class DeleteTeacher {
  final TeacherRepository _teacherRepository = TeacherRepository();

  DeleteTeacher();

  Future<Result> call(Teacher teacher) async {
    final result = await _teacherRepository.deleteTeacher(teacher);

    if (result) {
      return Result(
        message: 'Professor excluído com sucesso',
        success: true,
      );
    } else {
      return Result(
        message: 'Erro ao excluir professor',
        success: false,
      );
    }
  }
}
