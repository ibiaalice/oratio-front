import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/data/repositories/semester_repository.dart';

class GetSemesters {
  final SemesterRepository repository = SemesterRepository();

  GetSemesters();

  Future<List<Semester>> call() async {
    final result = await repository.getSemesters();
    final List<Semester> semesters = [];


    for(Map<String, dynamic> semester in result) {
      semesters.add(Semester.fromJson(semester));
    }
    return semesters;
  }
}
