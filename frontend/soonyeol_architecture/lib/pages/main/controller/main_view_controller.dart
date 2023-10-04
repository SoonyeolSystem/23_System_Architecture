import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/scenario/controller/scenario_main_controller.dart';
import 'package:soonyeol_architecture/pages/scenario/view/scenario_main_view_page.dart';
import 'package:soonyeol_architecture/pages/main/view/navigation.dart';
import 'package:soonyeol_architecture/pages/main/view/main_view_page.dart';

class MainViewController extends GetxController {
  RxInt pageIndex = 0.obs;

  void selectTab(int index) async {
    if (index == 1) {
      ScenarioMainController.instance.getScenarioList();
    }
    pageIndex.value = index;
    update();
  }

  static MainViewController get instance => Get.find<MainViewController>();
  final List<Widget> bodyContent = [
    const MainViewPage(),
    const ScenarioMainPage()
  ];
}
