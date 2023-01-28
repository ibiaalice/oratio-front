import 'package:dio/dio.dart';
import 'package:oratio/config/entities/user.dart';
import 'package:oratio/utils/common/constants.dart';

class UserRepository {
  final Dio dio = Dio();

  Future<bool> register(User user) async {
    final response =
        await dio.post('$API_URL/user/register', data: user.toJson());
    return response.statusCode == 200;
  }

  Future<bool> login(User user) async {
    final response = await dio.post('$API_URL/user/login', data: user.toJson());
    return response.statusCode == 200;
  }
}
