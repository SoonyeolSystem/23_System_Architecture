import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';

class MainViewPage extends StatelessWidget {
  const MainViewPage({super.key});

  static const String url = '/main';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainViewController());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Align(alignment: Alignment.topCenter, child: Text('main'))),
    );
  }
}
