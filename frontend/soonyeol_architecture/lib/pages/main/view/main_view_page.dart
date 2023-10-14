import 'package:flutter/material.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';

import '../../../../common/common.dart';

class MainViewPage extends StatelessWidget {
  const MainViewPage({super.key});

  static const String url = '/main';

  @override
  Widget build(BuildContext context) {
    final controller = MainViewController.instance;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 161, 180, 162),
        body: Center(
            child: Container(
                color: Colors.white,
                width: Common.getWidth,
                //height: Common.getHeight,
                child: Column(
                  children: [
                    Expanded(
                        child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 25, bottom: 25),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('SoonYeol', style: TextStyle(fontSize: 24, color: Color(0xFF33C26C), fontWeight: FontWeight.bold)),
                                    IconButton(
                                        onPressed: () => {},
                                        //Get.toNamed(ScenarioMainPage.url),
                                        padding: const EdgeInsets.only(left: 330.0),
                                        icon: const Icon(Icons.search)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
                  ],
                ))));
  }
}
