import 'package:dio/dio.dart';
import 'package:oratio/config/entities/accompaniments.dart';
import 'package:oratio/utils/common/constants.dart';

class AccompanimentsRepository {
  final Dio dio = Dio();

  Future<bool> create(Accompaniments accompaniments) async {
    final response = await dio.post('$API_URL/accompaniments/create',
        data: accompaniments.toJson());

    return response.statusCode == 200;
  }

  Future<bool> delete(Accompaniments accompaniments) async {
    final response =
        await dio.delete('$API_URL/accompaniments/${accompaniments.id}');

    return response.statusCode == 200;
  }

  Future<bool> edit(Accompaniments accompaniments) async {
    final response = await dio.put('$API_URL/accompaniments/edit',
        data: accompaniments.toJson());

    return response.statusCode == 200;
  }

  Future<List> getAccompanimentsByStudentId(int studentId) async {
    final response = await dio.get('$API_URL/accompaniments/$studentId');

    if (response.statusCode == 200) {
      var accompanimentsData = response.data as List;
      return accompanimentsData;
    }
    return [];
  }
}
