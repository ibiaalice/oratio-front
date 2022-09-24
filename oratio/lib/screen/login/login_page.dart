import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oratio/screen/login/widgets/login_card/login_card.dart';
import 'package:oratio/screen/login/widgets/register_button.dart';
import 'package:oratio/utils/style/oratio_colors.dart';
import 'package:oratio/utils/style/oratio_icons.dart';
import 'package:oratio/utils/widgets/animated_logo.dart';
import 'package:oratio/utils/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OratioColors.background,
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AnimatedLogo(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LoginCard(),
                RegisterButton(onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
