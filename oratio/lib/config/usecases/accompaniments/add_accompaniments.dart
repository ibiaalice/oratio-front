import 'package:oratio/config/entities/accompaniments.dart';
import 'package:oratio/config/entities/result.dart';
import 'package:oratio/data/repositories/accompaniments_repository.dart';

class AddAccompaniments {
  final AccompanimentsRepository accompanimentsRepository =
      AccompanimentsRepository();

  Future<Result> call(Accompaniments accompaniments) async {
    final result = await accompanimentsRepository.create(accompaniments);

    if (result) {
      return Result(
          success: true, message: 'Acompanhamento adicionado com sucesso!');
    } else {
      return Result(
          success: false, message: 'Erro ao adicionar acompanhamento!');
    }
  }
}
