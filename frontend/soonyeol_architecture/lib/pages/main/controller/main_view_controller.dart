import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/scenario/controller/scenario_main_controller.dart';
import 'package:soonyeol_architecture/pages/scenario/view/scenario_main_view_page.dart';
import 'package:soonyeol_architecture/pages/main/view/navigation.dart';
import 'package:soonyeol_architecture/pages/main/view/main_view_page.dart';
import 'package:soonyeol_architecture/pages/my_info/view/info_main_view_page.dart';

class MainViewController extends GetxController {
  RxInt pageIndex = 0.obs;

  void selectTab(int index) async {
    if (index == 1) {
      // ScenarioMainController.instance.getScenarioList();
      ScenarioMainPage();
    }
    pageIndex.value = index;
    update();
  }

  static MainViewController get instance => Get.find<MainViewController>();
  final List<Widget> bodyContent = [
    const MainViewPage(),
    const ScenarioMainPage(),
    const MyInfoPage(),
  ];

  RxInt bookmarkCount = 5.obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
