import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/scenario/controller/scenario_main_controller.dart';
import '../../../common/common.dart';
import 'component/scenario_component.dart';

class ScenarioMainPage extends StatelessWidget {
  const ScenarioMainPage({Key? key});

  static const String url = '/scenario/main';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScenarioMainController());
    return SizedBox(
      width: Common.getWidth,
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
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
                                const Text(
                                  '시나리오',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Column(
                        children: [
                          if (index == 0) const SizedBox(height: 20),
                          ScenarioComponent(
                              model: controller.scenarioList[index]),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10, top: 15),
                            child: Divider(
                              height: 1,
                              thickness: 1,
                            ),
                          ),
                        ],
                      );
                    },
                    childCount: controller.scenarioList.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
