import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/result.dart';
import 'package:oratio/data/repositories/project_repository.dart';

class DeleteProject {
  final ProjectRepository _projectRepository = ProjectRepository();

  Future<Result> call(Project project) async {
    final result = await _projectRepository.delete(project);

    if (result) {
      return Result(success: true, message: 'Projeto deletado com sucesso');
    } else {
      return Result(success: false, message: 'Erro ao deletar projeto');
    }
  }
}
