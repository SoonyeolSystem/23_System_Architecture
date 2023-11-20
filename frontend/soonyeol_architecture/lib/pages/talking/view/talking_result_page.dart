import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/main/controller/navigation_controller.dart';
import 'package:soonyeol_architecture/pages/main/view/navigation.dart';
import 'package:soonyeol_architecture/pages/my_info/controller/info_controller.dart';
import 'package:soonyeol_architecture/pages/talking/controller/talking_view_controller.dart';

import '../../../common/common.dart';

class TalkingResultPage extends StatelessWidget {
  const TalkingResultPage({super.key});

  static const String url = '/talking/result';

  @override
  Widget build(BuildContext context) {
    final controller = TalkingViewController.instance;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Container(
            width: Common.getWidth,
            color: Colors.black.withOpacity(0.9),
            child: Obx(
              () => Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    type: MaterialType.transparency,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 40.0, top: 50.0),
                        child: Text(
                          '좋은 대화였어요!',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    width: Common.getWidth - 100,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF434343),
                    ),
                    alignment: Alignment.topLeft,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Column(children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 35.0, top: 30.0),
                              child: Text(
                                '스피킹 평균 속도',
                                style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              // ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 35.0),
                              child: Text(
                                '${controller.speakingSpeed.value}',
                                style: const TextStyle(fontSize: 24, color: Color(0xFF33C26C), fontWeight: FontWeight.bold),
                              ),
                              // ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10, right: 48.0, top: 35.0),
                              child: Text('s', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                            // ),
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 35.0, top: 35.0),
                              child: Text(
                                '대화 나눈 횟수',
                                style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              // ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 35.0),
                              child: Text(
                                '',
                                style: const TextStyle(fontSize: 24, color: Color(0xFF33C26C), fontWeight: FontWeight.bold),
                              ),
                              // ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 40, top: 35.0),
                              child: Text('회', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                            // ),
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 35.0, top: 35.0),
                              child: Text(
                                '대화 나눈 시간',
                                style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              // ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 35.0),
                              child: Text(
                                '${controller.speakingTime.value}',
                                style: const TextStyle(fontSize: 24, color: Color(0xFF33C26C), fontWeight: FontWeight.bold),
                              ),
                              // ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 40, top: 35.0),
                              child: Text('m', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                            // ),
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 35.0, top: 35.0),
                              child: Text(
                                '토킹 점수',
                                style: TextStyle(fontSize: 24, color: Color(0xFF33C26C), fontWeight: FontWeight.bold),
                              ),
                              // ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 35.0),
                              child: Text(
                                '${controller.talkingScore.value}',
                                style: const TextStyle(fontSize: 24, color: Color(0xFF33C26C), fontWeight: FontWeight.bold),
                              ),
                              // ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 40, top: 35.0),
                              child: Text('점', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                            // ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                  Material(
                    type: MaterialType.transparency,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 40.0, top: 50.0),
                        child: Text(
                          'GPT의 피드백',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: Common.getWidth - 100,
                    height: 200,
                    // alignment: Alignment.center,
                    child: const SingleChildScrollView(
                      // physics: const BouncingScrollPhysics(),
                      // controller: controller.scrollcontroller.value,
                      child: Text(
                        '이곳에 긴 글을 넣어주세요. 이 글이 화면보다 길어지면 스크롤이 가능하도록 설정되었습니다. '
                        'Flutter는 이러한 기능을 지원하기 위해 SingleChildScrollView와 같은 다양한 위젯을 제공합니다. '
                        '이를 통해 사용자는 긴 컨텐츠를 편리하게 탐색할 수 있습니다. '
                        '글이 계속 이어지면, 이 글은 화면의 크기를 초과하여 아래로 확장됩니다. '
                        '따라서 사용자는 화면을 스크롤하여 글의 나머지 부분을 볼 수 있습니다. '
                        '이와 같이 Flutter는 사용자 경험을 향상시키기 위한 다양한 위젯과 도구를 제공합니다.',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () async {
                        //showSnackBar();
                        Get.offAllNamed(Navigation.url);
                        MyInfoViewController.instance.getInfoList();

                        final controller = NavigationController.instance;
                        controller.selectTab(2);
                        // final controller2 = MyInfoViewController.instance;
                        // await Future.delayed(const Duration(milliseconds: 50));

                        // // Accessing the actual ScrollController instance
                        // final actualScrollController = controller2.scrollcontroller.value;

                        // // Getting the maximum scroll extent
                        // final maxScrollExtent = actualScrollController.position.maxScrollExtent;

                        // // Animating to the bottom
                        // actualScrollController.animateTo(maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                      },
                      style: ElevatedButton.styleFrom(
                        //backgroundColor: Colors.blue,
                        backgroundColor: const Color(0xFF33C26C),
                        minimumSize: const Size(400, 60),
                      ),
                      child: const Text(
                        '대화 저장하기',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showSnackBar() {
  Get.snackbar('', '',
      maxWidth: Common.getWidth,
      titleText: Container(),
      messageText: const Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: Text(
          '대화가 저장되었습니다.',
          style: TextStyle(color: Colors.white),
        ),
      ),
      colorText: Colors.white,
      backgroundColor: Colors.black,
      snackPosition: SnackPosition.BOTTOM);
}
