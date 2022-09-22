import 'package:flutter/material.dart';
import 'package:oratio/screen/login/widgets/login_card/login_image_card.dart';
import 'package:oratio/screen/login/widgets/login_card/login_subtitle_card.dart';
import 'package:oratio/screen/login/widgets/login_card/login_title_card.dart';
import 'package:oratio/utils/style/oratio_colors.dart';
import 'package:oratio/utils/widgets/custom_text_form_field.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 40.0,
      ),
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
              onChanged: () {},
              isPassword: true,
            ),

            // const LoginTextField(),
            // const LoginTextField(),
            // const LoginButton(),
          ],
        ),
      ),
    );
  }
}
