import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/result.dart';
import 'package:oratio/data/repositories/project_repository.dart';

class EditProject {
  final ProjectRepository _projectRepository = ProjectRepository();

  EditProject();

  Future<Result> call(Project project) async {
    final result = await _projectRepository.editProject(project);

    if (result) {
      return Result(success: true, message: 'Project edited successfully');
    } else {
      return Result(success: false, message: 'Error');
    }
  }
}
