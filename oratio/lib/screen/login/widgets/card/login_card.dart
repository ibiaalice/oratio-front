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
            CustomTextFormField(
              title: 'Matricula',
              onChanged: () {},
            ),
            CustomTextFormField(
              title: 'Senha',
              isPassword: true,
              onChanged: () {},
            ),
            LoginButton(
              onPressed: () {
                onTapLogin();
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
