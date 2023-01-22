import 'dart:convert';
import 'dart:developer';
import 'dart:html';

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
      try {
        final Project project = Project.fromJson(response.data);

        return project;
      } catch (e) {
        log(e.toString());
      }
    }

    return null;
  }
}
