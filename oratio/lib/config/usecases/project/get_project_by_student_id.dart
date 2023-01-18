
import 'package:dio/dio.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/data/repositories/project_repository.dart';

class GetProjectByStudentId {
  final ProjectRepository _projectRepository = ProjectRepository();

  GetProjectByStudentId();

  Future<Project?> call(int studentId) async {
    final Response response =
        await _projectRepository.getProjectByStudentId(studentId);

    if (response.statusCode == 200) {
      return Project.fromJson(response.data);
    }

    return null;
  }
}
