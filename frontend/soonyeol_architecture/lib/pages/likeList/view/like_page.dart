import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/likeList/controller/like_view_controller.dart';
import 'package:soonyeol_architecture/pages/main/view/component/likeSituationcomponent.dart';

import '../../../common/common.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  static const String url = '/like';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LikeViewController());
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          //color: Colors.white,
          // 중앙 정렬
          width: Common.getWidth,
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 25,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  '즐겨찾기한 시나리오',
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: Color.fromARGB(255, 39, 15, 15),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => (controller.situationlikeList.isEmpty)
                        ? const Text("아직 즐겨찾기 한 시나리오가 없어요!")
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                for (int index = 0; index < controller.situationlikeList.length; index++)
                                  Column(
                                    children: [
                                      if (index == 0) const SizedBox(height: 20),
                                      LikeSituationComponent(
                                        model: controller.situationlikeList.value[index],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10, top: 15),
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
              )),
        ),
      ),
    );
  }
}
