import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/utils/common/constants.dart';

import '../../config/entities/result.dart';

class ProjectRepository {
  final Dio dio = Dio();

  Future<bool> delete(Project project) async {
    final response = await dio.delete('$API_URL/project/delete/${project.id}');

    return response.statusCode == 200;
  }

  Future<bool> editProject(Project editProject) async {
    final response =
        await dio.post('$API_URL/project/edit', data: editProject.toJson());

    return response.statusCode == 200;
  }

  Future<List> getProjects() async {
    final response = await dio.get('$API_URL/project/all');

    if (response.statusCode == 200) {
      var projectsData = response.data as List;
      return projectsData;
    }
    return [];
  }

  Future<List> getProjectsBySemester(int semesterId) async {
    final response = await dio.get('$API_URL/project/semester/$semesterId');

    if (response.statusCode == 200) {
      var projectsData = response.data as List;
      return projectsData;
    }
    return [];
  }

  Future<Response> getProjectByStudentId(int studentId) async {
    final response = await dio.get('$API_URL/project/$studentId');

    return response;
  }

  Future<bool> createProject(Project project) async {
    final response =
        await dio.post('$API_URL/project/create', data: project.toJson());

    return (response.statusCode == 200);
  }
}
