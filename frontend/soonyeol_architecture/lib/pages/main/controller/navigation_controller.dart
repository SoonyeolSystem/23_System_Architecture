import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/main/view/main_view_page.dart';
import 'package:soonyeol_architecture/pages/my_info/view/info_main_view_page.dart';
import 'package:soonyeol_architecture/pages/scenario/view/scenario_main_view_page.dart';

class NavigationController extends GetxController {
  RxInt pageIndex = 0.obs;

  void selectTab(int index) async {
    pageIndex.value = index;
    update();
  }

  static NavigationController get instance => Get.find<NavigationController>();
  final List<Widget> bodyContent = [
    const MainViewPage(),
    const ScenarioMainPage(),
    const MyInfoPage(),
  ];
}
