import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/utils/common/constants.dart';

import '../../config/entities/result.dart';

class ProjectRepository {
  final Dio dio = Dio();

  Future<Result> editProject(Project editProject) async {
    final body = editProject.toJson();
    log('editProject: $body');
    final response = await dio.post(
      '$API_URL/project/edit',
      data: editProject.toJson(),
    );

    if (response.statusCode == 200) {
      return Result(success: true, message: 'Project edited successfully');
    }
    return Result(success: false, message: 'Error');
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
}
