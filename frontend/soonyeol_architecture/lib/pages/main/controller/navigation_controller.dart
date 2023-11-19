import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';
import 'package:soonyeol_architecture/pages/main/view/main_view_page.dart';
import 'package:soonyeol_architecture/pages/my_info/controller/info_controller.dart';
import 'package:soonyeol_architecture/pages/my_info/view/info_main_view_page.dart';
import 'package:soonyeol_architecture/pages/situation/controller/situation_main_controller.dart';
import 'package:soonyeol_architecture/pages/situation/view/situation_main_view_page.dart';

class NavigationController extends GetxController {
  RxInt pageIndex = 0.obs;

  void selectTab(int index) async {
    if (index == 0) {
      MainViewController.instance.getBestConversationList();
      SituationMainController.instance.getLikeSituationlist();
    } else if (index == 1) {
      SituationMainController.instance.getSituationList();
    } else if (index == 2) {
      MyInfoViewController.instance.getInfoList();
    }
    pageIndex.value = index;
    update();
  }

  static NavigationController get instance => Get.find<NavigationController>();
  final List<Widget> bodyContent = [
    const MainViewPage(),
    const SituationMainPage(),
    const MyInfoPage(),
  ];
}
