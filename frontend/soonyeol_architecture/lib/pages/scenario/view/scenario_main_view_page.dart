import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:soonyeol_architecture/pages/scenario/controller/scenario_main_controller.dart';
import '../../../common/common.dart';

class ScenarioMainPage extends StatelessWidget {
  const ScenarioMainPage({super.key});

  static const String url = '/scenario/main';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScenarioMainController());
    return SizedBox(
      width: Common.getWidth,
      child: Column(children: [
        Expanded(
            child: CustomScrollView(
          // controller: controller.scrollcontroller.value,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 40, top: 40),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('시나리오',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black)),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      )
                    ]),
              ),
            )
          ],
        ))
      ]),
    );
  }
}
