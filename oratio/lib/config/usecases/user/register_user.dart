import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/user.dart';
import 'package:oratio/data/repositories/user_repository.dart';

class RegisterUser {
  final UserRepository _userRepository = UserRepository();

  Future<Result> call(User user) async {
    final result = await _userRepository.register(user);

    if (result) {
      return Result(
        success: true,
        message: 'Usuário cadastrado com sucesso!',
      );
    } else {
      return Result(
        success: false,
        message: 'Erro ao cadastrar usuário!',
      );
    }
  }
}
