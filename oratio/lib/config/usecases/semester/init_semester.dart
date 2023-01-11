import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/data/repositories/semester_repository.dart';

class InitSemester {
  final SemesterRepository _semesterRepository = SemesterRepository();

  Future<Result> call(Semester semester) async {
    final result = await _semesterRepository.addSemester(semester);

    if (result) {
      return Result(success: true, message: 'Semestre iniciado com sucesso');
    }
    return Result(success: false, message: 'Desculpe, ocorreu um erro');
  }
}
