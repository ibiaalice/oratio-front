import 'package:flutter/material.dart';
import 'package:oratio/screen/home/home_page.dart';
import 'package:oratio/screen/login/login_page.dart';
import 'package:oratio/screen/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = true;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: Routers.primaryRoutes,
      home: isLoading ? LoginPage() : HomePage(),
    );
  }
}
