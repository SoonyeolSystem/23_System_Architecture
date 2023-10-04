import 'package:flutter/material.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';

class MainViewPage extends StatelessWidget {
  const MainViewPage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    final controller = MainViewController.instance;
    return Scaffold(
      body: Center(
        child: Text('MainViewPage'),
      ),
=======
    final controller = Get.put(MainViewController());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Align(alignment: Alignment.topCenter, child: Text('main'))),
>>>>>>> Stashed changes
    );
  }
}
