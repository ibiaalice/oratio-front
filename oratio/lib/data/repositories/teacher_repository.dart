import 'package:dio/dio.dart';
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
}
