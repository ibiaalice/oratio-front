import 'package:oratio/config/entities/accompaniments.dart';
import 'package:oratio/config/entities/result.dart';
import 'package:oratio/data/repositories/accompaniments_repository.dart';

class EditAccompaniments {
  final AccompanimentsRepository accompanimentRepository =
      AccompanimentsRepository();

  Future<Result> call(Accompaniments accompaniment) async {
    final result = await accompanimentRepository.edit(accompaniment);

    if (result) {
      return Result(
          success: true, message: 'Acompanhamento editado com sucesso');
    } else {
      return Result(success: false, message: 'Erro ao editar acompanhamento');
    }
  }
}
