import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:oratio/utils/common/constants.dart';

class TeacherRepository {
  Future<List> getTeachers() async {
    final Uri uri = Uri.parse('$API_URL/teacher/all');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var teachersData = json.decode(response.body) as List;
      return teachersData;
    }

    return [];
  }
}
