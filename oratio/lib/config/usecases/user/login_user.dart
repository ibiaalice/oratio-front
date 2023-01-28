import 'package:oratio/config/entities/user.dart';
import 'package:oratio/data/repositories/user_repository.dart';

class LoginUser {
  final UserRepository _userRepository = UserRepository();

  Future<bool> call(User user) async {
    return await _userRepository.login(user);
  }
}
