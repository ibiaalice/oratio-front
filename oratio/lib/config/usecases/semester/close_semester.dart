import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/data/repositories/semester_repository.dart';

class CloseSemester {
  final SemesterRepository _semesterRepository = SemesterRepository();

  Future<Result> call(Semester semester) async {
    final result = await _semesterRepository.closeSemester(semester.copyWith(
      status: 'CLOSED',
    ));

    if (result) {
      return Result(success: result, message: 'Semestre concluído com sucesso');
    }
    return Result(success: result, message: 'Desculpe, ocorreu um erro');
  }
}
