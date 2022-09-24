import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/screen/login/login_store.dart';
import 'package:oratio/screen/login/widgets/card/login_card.dart';
import 'package:oratio/screen/login/widgets/register_button.dart';
import 'package:oratio/utils/style/oratio_colors.dart';
import 'package:oratio/utils/widgets/animated_logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final store = LoginStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OratioColors.background,
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AnimatedLogo(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginCard(
                    actualAccountType: store.accountType,
                    onAccountTypeChanged: (value) =>
                        store.changeAccountType(value),
                    onTapLogin: () => store.saveAccountType(),
                  ),
                  RegisterButton(
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
