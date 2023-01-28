import 'package:flutter/material.dart';
import 'package:oratio/screen/home/home_page.dart';
import 'package:oratio/screen/login/login_page.dart';
import 'package:oratio/screen/register/register_page.dart';

class Routers {
  Routers._();

  static Map<String, Widget Function(BuildContext)> get primaryRoutes => {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      };
}
