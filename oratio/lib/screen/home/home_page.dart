import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/config/core/account_type.dart';
import 'package:oratio/screen/home/home_store.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = HomeStore();

  @override
  void initState() {
    super.initState();
    store.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OratioColors.background,
      body: Observer(builder: (context) {
        if (store.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        
        return Column(
          children: [
            const Center(
              child: Text('Home'),
            ),
            Text(store.accountType?.name ?? ''),
          ],
        );
      }),
    );
  }
}
