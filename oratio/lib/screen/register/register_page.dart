import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/screen/home/widgets/circle_pending_load.dart';
import 'package:oratio/screen/register/register_store.dart';
import 'package:oratio/utils/style/oratio_colors.dart';
import 'package:oratio/utils/widgets/success_message_alert.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final store = RegisterStore();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        backgroundColor: OratioColors.background,
        body: store.isLoading
            ? const Center(child: CirclePendingLoad())
            : Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Card(
                    child: Container(
                      width: 600,
                      margin: const EdgeInsets.symmetric(
                        vertical: 50,
                        horizontal: 20,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _title(),
                          _infoTitle('Nome Completo:'),
                          _infoField(_nameController, false),
                          _infoTitle('Email:'),
                          _infoField(_emailController, false),
                          _infoTitle('Senha:'),
                          _infoField(_passwordController, true),
                          _infoTitle('Confirmar Senha:'),
                          _infoField(_confirmPasswordController, true),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _loginButton(),
                              _registerButton(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      );
    });
  }

  Widget _loginButton() => TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text(
          'Login',
        ),
      );

  Widget _registerButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: OratioColors.text,
        ),
        child: const SizedBox(
          width: 200,
          child: Center(
            child: Text('Registrar'),
          ),
        ),
        onPressed: () async {
          if (_validateRegister) {
            final result = await store.register(
              name: _nameController.text,
              email: _emailController.text,
              password: _passwordController.text,
            );
            if (result.success) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const SuccessMessageAlert(
                      message:
                          'Usuário cadastrado com sucesso! realize o login para continuar',
                    );
                  }).then(
                (value) => Navigator.pop(context),
              );
            } else {
              ScaffoldMessenger.of(context).showMaterialBanner(
                _redBanner(result.message),
              );
            }
          }
        },
      );

  MaterialBanner _redBanner(String message) => MaterialBanner(
        onVisible: () => Future.delayed(
          const Duration(seconds: 3),
          () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
        ),
        actions: [
          TextButton(
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            child: const Text(
              'Fechar',
              style: TextStyle(
                color: OratioColors.white,
              ),
            ),
          ),
        ],
        content: Text(
          message,
          style: const TextStyle(
            color: OratioColors.white,
          ),
        ),
        backgroundColor: OratioColors.alertRed,
      );

  bool _validateEmail(String value) {
    final emailRegexp = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+\.?[a-zA-Z]+',
    );
    return emailRegexp.hasMatch(value);
  }

  bool _validatePassword() {
    return _passwordController.text == _confirmPasswordController.text;
  }

  bool _validateName(String value) {
    final nameRegexp = RegExp(
      r'^[a-zA-Z ]+$',
    );
    return nameRegexp.hasMatch(value);
  }

  bool get _validateRegister {
    if (!_validateName(_nameController.text)) {
      ScaffoldMessenger.of(context).showMaterialBanner(
        _redBanner(
          'Nome inválido',
        ),
      );
      return false;
    }
    if (!_validateEmail(_emailController.text)) {
      ScaffoldMessenger.of(context).showMaterialBanner(
        _redBanner(
          'Email inválido',
        ),
      );
      return false;
    }
    if (!_validatePassword()) {
      ScaffoldMessenger.of(context).showMaterialBanner(
        _redBanner(
          'Senha inválida',
        ),
      );
      return false;
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showMaterialBanner(
        _redBanner(
          'As senhas não coincidem',
        ),
      );
      return false;
    }
    return true;
  }

  Widget _infoField(TextEditingController controller, bool isPassword) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          obscureText: isPassword,
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      );

  Widget _title() => const Padding(
        padding: EdgeInsets.only(top: 20, bottom: 100),
        child: Text(
          'Registre-se',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      );

  Widget _infoTitle(String value) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
