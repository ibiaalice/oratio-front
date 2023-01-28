import 'package:flutter/material.dart';
import 'package:oratio/config/core/enums/account_type.dart';
import 'package:oratio/screen/login/widgets/card/login_button.dart';
import 'package:oratio/screen/login/widgets/card/login_image_card.dart';
import 'package:oratio/screen/login/widgets/card/login_subtitle_card.dart';
import 'package:oratio/screen/login/widgets/card/login_title_card.dart';
import 'package:oratio/utils/style/oratio_colors.dart';
import 'package:oratio/utils/widgets/custom_text_form_field.dart';

class LoginCard extends StatelessWidget {
  final AccountType actualAccountType;
  final Function onTapLogin;
  final Function(AccountType) onAccountTypeChanged;

  const LoginCard({
    super.key,
    required this.actualAccountType,
    required this.onAccountTypeChanged,
    required this.onTapLogin,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(right: 50, top: 80),
      child: Container(
        color: OratioColors.white,
        width: screenSize.width * 0.2,
        child: Column(
          children: [
            const LoginImageCard(),
            const LoginTitleCard(),
            const LoginSubtitleCard(),
            _customTextFormField(
              title: 'E-mail',
              controller: _emailController,
            ),
            _customTextFormField(
              title: 'Senha',
              isPassword: true,
              controller: _passwordController,
            ),
            LoginButton(
              onPressed: () {
                if (_emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  onTapLogin(_emailController.text, _passwordController.text);
                } else {
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    _redBanner('Preencha todos os campos', context),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  MaterialBanner _redBanner(String message, context) => MaterialBanner(
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

  Widget _customTextFormField(
      {required String title,
      bool isPassword = false,
      required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: const TextStyle(
                color: OratioColors.black,
                fontSize: 16,
                fontFamily: 'Play',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: OratioColors.grey,
            child: Column(
              children: [
                TextFormField(
                  obscureText: isPassword,
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                      color: OratioColors.medium2Grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
