import 'package:oratio/config/entities/accompaniments.dart';
import 'package:oratio/data/repositories/accompaniments_repository.dart';

class GetAccompaniments {
  final AccompanimentsRepository accompanimentsRepository =
      AccompanimentsRepository();

  Future<List<Accompaniments>> byStudentId(int studentId) async {
    final result =
        await accompanimentsRepository.getAccompanimentsByStudentId(studentId);

    return result
        .map((accompaniment) => Accompaniments.fromJson(accompaniment))
        .toList();
  }
}
