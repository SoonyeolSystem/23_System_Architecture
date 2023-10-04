import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';
import 'package:soonyeol_architecture/common/title.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  static const String url = '/main';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainViewController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Align(
              alignment: Alignment.topCenter,
              child: Obx(
                  () => controller.bodyContent[controller.pageIndex.value]))),
      bottomNavigationBar: homeNavigationBar(),
    );
  }

  static Widget homeNavigationBar() {
    final controller = MainViewController.instance;
    return Title(
      title: PageTitle.main,
      color: Colors.white,
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey, width: 0.2))),
          child: SafeArea(
            top: false,
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  children: [
                    Expanded(
                        child: _bottomNavigationButton(
                            index: 0, icon: [Icons.feed_outlined, Icons.feed])),
                    // Expanded(child: _bottomNavigationButton(index: 1, icon: [Icons.search_outlined, LineIcons.search])),
                    Expanded(
                        child: _bottomNavigationButton(index: 1, icon: [
                      Icons.access_time,
                      Icons.access_time_filled
                    ])),
                    Expanded(
                        child: _bottomNavigationButton(index: 2, icon: [
                      Icons.account_circle_outlined,
                      Icons.account_circle
                    ])),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _bottomNavigationButton(
      {required int index, required List<IconData> icon}) {
    final controller = MainViewController.instance;
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        controller.selectTab(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child:
            Obx(() => Icon(icon[index == controller.pageIndex.value ? 1 : 0])),
      ),
    );
  }
}
