import 'package:flutter/material.dart';
import 'package:oratio/screen/home/home_page.dart';
import 'package:oratio/screen/login/login_page.dart';
import 'package:oratio/screen/router.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = true;

    return MaterialApp(
      title: 'Oratio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Play",
        primaryColor: OratioColors.primary,
        accentColor: OratioColors.accent,
        backgroundColor: OratioColors.background,
      ),
      initialRoute: '/',
      routes: Routers.primaryRoutes,
      home: isLoading ? LoginPage() : HomePage(),
    );
  }
}
