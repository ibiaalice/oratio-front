import 'package:dio/dio.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/utils/common/constants.dart';

class TeacherRepository {
  final Dio dio = Dio();

  Future<List> getTeachers() async {
    var response = await dio.get('$API_URL/teacher/all');

    if (response.statusCode == 200) {
      var teachersData = response.data as List;
      return teachersData;
    }

    return [];
  }

  Future<bool> addTeacher(Teacher teacher) async {
    var response =
        await dio.post('$API_URL/teacher/create', data: teacher.toJson());

    return response.statusCode == 200;
  }

  Future<bool> deleteTeacher(Teacher teacher) async {
    var response = await dio.delete('$API_URL/teacher/delete/${teacher.id}');

    return response.statusCode == 200;
  }
}
