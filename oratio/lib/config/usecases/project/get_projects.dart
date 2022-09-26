import 'package:oratio/config/entities/project.dart';
import 'package:oratio/data/repositories/project_repository.dart';

class GetProjects {
  final ProjectRepository repository = ProjectRepository();

  GetProjects();

  Future<List<Project>> call() async {
    final response = await repository.getProjects();

    return response.map((project) => Project.fromJson(project)).toList();
  }
}
