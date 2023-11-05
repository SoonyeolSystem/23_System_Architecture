import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soonyeol_architecture/pages/my_info/controller/info_controller.dart';
import 'package:soonyeol_architecture/pages/my_info/view/component/myinfo_component.dart';

import '../../../../common/common.dart';

class MyInfoPage extends StatelessWidget {
  const MyInfoPage({super.key});

  static const String url = '/info';

  @override
  Widget build(BuildContext context) {
    final controller = MyInfoViewController.instance;
    return Center(
        child: SizedBox(
      width: Common.getWidth,
      child: SingleChildScrollView(
        controller: controller.scrollcontroller.value,
        physics: const BouncingScrollPhysics(),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.,
            children: [
              Material(
                type: MaterialType.transparency,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: Common.getWidth * 0.05, top: 25.0, bottom: 35),
                        child: Text(
                          '${controller.userName.value} 님의 정보',
                          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed('/route');
                      },
                      child: Row(
                        children: [
                          const Text(
                            '로그아웃',
                            style: TextStyle(fontSize: 15, color: Color(0xFF888888)),
                          ),
                          Transform.rotate(
                            angle: math.pi,
                            child: Container(
                              margin: EdgeInsets.only(left: Common.getWidth * 0.085, right: 5, bottom: 2),
                              child: const Icon(
                                Iconsax.logout,
                                size: 20,
                                color: Color(0xFF888888),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 25, right: 0, bottom: 15),
                    height: 180,
                    width: 170,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 244, 244, 246),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 42.0),
                          child: Icon(
                            Iconsax.timer_15,
                            size: 40,
                            color: Color.fromARGB(255, 130, 156, 223),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          '총 학습 시간',
                          style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 102, 102, 103)),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.speakingTime.value.toString(),
                              style: const TextStyle(fontSize: 24, color: Color(0xFF384252), fontWeight: FontWeight.w900),
                            ),
                            const Text(
                              '분',
                              style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 102, 102, 103)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 0, right: 25, bottom: 15),
                    height: 180,
                    width: 170,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 244, 244, 246),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Iconsax.message_text_15,
                          size: 40,
                          color: Color.fromARGB(255, 172, 168, 150),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          '총 말한 문장',
                          style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 102, 102, 103)),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.speakingCount.value.toString(),
                              style: const TextStyle(fontSize: 24, color: Color(0xFF384252), fontWeight: FontWeight.w900),
                            ),
                            const Text(
                              '개',
                              style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 102, 102, 103)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 25, bottom: 40),
                    height: 180,
                    width: 170,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 244, 244, 246),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Iconsax.ranking_15,
                          size: 40,
                          color: Color.fromARGB(255, 255, 233, 120),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          '대화 평균 점수',
                          style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 102, 102, 103)),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.talkingScore.value.toString(),
                              style: const TextStyle(fontSize: 24, color: Color(0xFF384252), fontWeight: FontWeight.w900),
                            ),
                            const Text(
                              '점',
                              style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 102, 102, 103)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 0, right: 25, bottom: 40),
                    height: 180,
                    width: 170,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 244, 244, 246),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Iconsax.video_horizontal5,
                          size: 40,
                          color: Colors.green,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '완료한 시나리오',
                          style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 102, 102, 103)),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.completeSituation.value.toString(),
                              style: const TextStyle(fontSize: 24, color: Color(0xFF384252), fontWeight: FontWeight.w900),
                            ),
                            const Text(
                              '개',
                              style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 102, 102, 103)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: double.infinity, //가로 꽉 차게 설정
                height: 15,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Color.fromARGB(255, 242, 242, 242)),
                ),
              ),
              Container(
                //key: ongoingKey,
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: Common.getWidth * 0.05, top: 25.0, bottom: 30),
                  child: const Text(
                    '지난 나의 대화',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: Common.getWidth * 0.07, right: Common.getWidth * 0.07),
                  height: 1.0,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 209, 209, 209)),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: Common.getWidth * 0.085, top: 10),
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 1, 215, 4),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.only(bottom: 30),
                    alignment: Alignment.centerLeft,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 10),
                      child: Text(
                        '진행중',
                        style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              ////진행중인 시나리오
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40),
                child: Obx(
                  () => Column(children: [
                    for (int index = 0; index < controller.myConversation.length; index++)
                      Column(
                        children: [
                          if (controller.myConversation[index].endStory == false)
                            InfoViewComponent(
                              model: controller.myConversation[index],
                            ),
                          if (controller.myConversation[index].endStory == false)
                            const Divider(
                              height: 1,
                              thickness: 1,
                            ),
                        ],
                      ),
                  ]),
                ),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: Common.getWidth * 0.085, top: 5),
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 0, 0),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 10),
                      child: Text(
                        '완료',
                        style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              //완료된 시나리오
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40),
                child: Obx(() => Column(children: [
                      for (int index = 0; index < controller.myConversation.length; index++)
                        Column(
                          children: [
                            if (controller.myConversation[index].endStory == true) InfoViewComponent(model: controller.myConversation[index]),
                            if (controller.myConversation[index].endStory == true)
                              const Divider(
                                height: 1,
                                thickness: 1,
                              ),
                          ],
                        ),
                    ])),
              ),
              const SizedBox(height: 80),
            ]),
      ),
    ));
  }
}
