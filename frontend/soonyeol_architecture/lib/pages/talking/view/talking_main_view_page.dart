import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/talking/controller/talking_view_controller.dart';
import 'package:soonyeol_architecture/pages/talking/view/component/talking_viewpage_component.dart';

class TalkingViewPage extends StatelessWidget {
  const TalkingViewPage({super.key});

  static const String url = '/talking';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TalkingViewController());
    return SizedBox(
        child: Column(
      children: [
        Expanded(
            child: CustomScrollView(
          controller: controller.scrollcontroller.value,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 45, bottom: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('사막에서 살아남기', style: TextStyle(fontSize: 20)),
                        const SizedBox(
                          width: 7,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => SliverList(
                  delegate: SliverChildBuilderDelegate(
                ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        if (index == 0) const SizedBox(height: 20),
                        TalkingViewComponent(
                            model: controller.talkingList.value[index]),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10, top: 15),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                          ),
                        )
                      ],
                    ),
                  );
                }),
                childCount: controller.talkingList.length,
              )),
            )
          ],
        ))
      ],
    ));
  }
}
