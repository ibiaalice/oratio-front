import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/data/repositories/semester_repository.dart';

class GetActiveSemester {
  final SemesterRepository repository = SemesterRepository();

  Future<Semester?> call() async {
    final result = await repository.getActiveSemester();

    if (result != null) {
      return Semester.fromJson(result);
    }

    return null;
  }
}
