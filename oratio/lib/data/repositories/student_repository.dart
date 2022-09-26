import 'package:dio/dio.dart';
import 'package:oratio/utils/common/constants.dart';

class StudentRepository {
  final Dio dio = Dio();

  Future<List> getStudents() async {
    final response = await dio.get('$API_URL/student/all');

    if (response.statusCode == 200) {
      var studentsData = response.data as List;
      return studentsData;
    }

    return [];
  }
}
