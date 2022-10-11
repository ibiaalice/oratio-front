import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/data/repositories/semester_repository.dart';

class GetSemesters {
  final SemesterRepository repository = SemesterRepository();

  GetSemesters();

  Future<List<Semester>> call() async {
    final result = await repository.getSemesters();

    return result.map((semester) => Semester.fromJson(semester)).toList();
  }
}
