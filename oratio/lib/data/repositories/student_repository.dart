import 'package:dio/dio.dart';
import 'package:oratio/config/entities/student.dart';
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

  Future<bool> addStudent(Student student) async {
    final response =
        await dio.post('$API_URL/student/create', data: student.toJson());

    return response.statusCode == 200;
  }

  Future<bool> delete(Student student) async {
    final response = await dio.delete('$API_URL/student/delete/${student.id}');

    return response.statusCode == 200;
  }
}
