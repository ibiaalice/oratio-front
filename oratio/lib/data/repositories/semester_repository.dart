import 'package:dio/dio.dart';
import 'package:oratio/config/entities/semester.dart';
import 'package:oratio/utils/common/constants.dart';

class SemesterRepository {
  final Dio dio = Dio();

  Future getActiveSemester() async {
    final response = await dio.get('$API_URL/semester/active');

    if (response.statusCode == 200) {
      final semesterData = response.data;
      return semesterData;
    }

    return null;
  }

  Future<List> getSemesters() async {
    final response = await dio.get('$API_URL/semester/all');

    if (response.statusCode == 200) {
      final semestersData = response.data as List;
      return semestersData;
    }
    return [];
  }

  Future<bool> closeSemester(Semester semester) async {
    final response = await dio.put('$API_URL/semester/${semester.id}',
        data: semester.toEditJson());

    return response.statusCode == 200;
  }

  Future<bool> addSemester(Semester semester) async {
    final response =
        await dio.post('$API_URL/semester/create', data: semester.toJson());

    return response.statusCode == 200;
  }
}
