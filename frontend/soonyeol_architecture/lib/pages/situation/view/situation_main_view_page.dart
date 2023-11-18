import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/situation/controller/situation_main_controller.dart';
import 'package:soonyeol_architecture/pages/situation/view/component/situation_component.dart';

import '../../../common/common.dart';

class SituationMainPage extends StatelessWidget {
  const SituationMainPage({super.key});

  static const String url = '/situation/main';

  @override
  Widget build(BuildContext context) {
    final controller = SituationMainController.instance;
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: Common.getWidth,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 28),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '시나리오',
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Color.fromARGB(255, 39, 15, 15),
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
                Obx(
                  () => (controller.situationList.isEmpty)
                      ? const CircularProgressIndicator(
                          color: Color(0xFF33C26C))
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              for (int index = 0;
                                  index < controller.situationList.length;
                                  index++)
                                Column(
                                  children: [
                                    if (index == 0) const SizedBox(height: 20),
                                    SituationComponent(
                                        model: controller
                                            .situationList.value[index]),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 10, top: 15),
                                      child: Divider(
                                        height: 1,
                                        thickness: 1,
                                      ),
                                    ),
                                  ],
                                )
                            ],
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
