import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/login/view/login_page.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';
import 'package:soonyeol_architecture/pages/main/controller/navigation_controller.dart';
import 'package:soonyeol_architecture/pages/main/view/component/bestTalking_component.dart';
import 'package:soonyeol_architecture/pages/main/view/component/ongoing_component.dart';
import 'package:soonyeol_architecture/pages/my_info/controller/info_controller.dart';
import 'package:soonyeol_architecture/pages/my_info/view/info_main_view_page.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_custom_page.dart';
import '../../../../common/common.dart';

class MainViewPage extends StatelessWidget {
  const MainViewPage({super.key});

  static const String url = '/main';

  @override
  Widget build(BuildContext context) {
    final controller = MainViewController.instance;
    bool isLogined = true;

    return SizedBox(
      width: Common.getWidth,
      //height: Common.getHeight,
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.only(top: 28, bottom: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //순열 타이틀, 검색 버튼
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('SoonYeol',
                            style: TextStyle(
                                fontSize: 26,
                                color: Color(0xFF33C26C),
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    //공간 띄우기
                    const SizedBox(height: 40),
                    //커스텀 버튼, 즐겨찾기 버튼
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //커스텀 버튼
                        SizedBox(
                          width: 182,
                          height: 185,
                          child: Material(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                Get.toNamed(TalkingCustomPage.url);
                                // 버튼이 클릭되었을 때 실행되는 코드
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(255, 183, 230, 183),
                                      Color.fromARGB(255, 26, 141, 72)
                                    ], // 그라데이션 색상 설정
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            '커스텀\n시나리오',
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 27),
                                          Text(
                                            '나만의 시나리오를\n직접 만들어보세요!',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        //버튼 간 간격 띄우기
                        const SizedBox(width: 40),
                        //즐겨찾기 버튼
                        SizedBox(
                          width: 182,
                          height: 185,
                          child: Material(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                // 버튼이 클릭되었을 때 실행되는 코드
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(57, 140, 187, 126),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            '즐겨찾기',
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Color.fromARGB(
                                                    255, 46, 161, 92),
                                                fontWeight: FontWeight.w700),
                                            textAlign: TextAlign.left,
                                          ),
                                          const SizedBox(height: 70),
                                          const Text(
                                            '즐겨찾기한',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black54),
                                            textAlign: TextAlign.center,
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                '시나리오를 확인해보세요',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //공간 띄우기
                    const SizedBox(height: 40),
                    //이어서 대화하기
                    Row(
                      // crossAxisAlignment:
                      //     CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 25),
                        const Text('이어서 대화하기',
                            style: TextStyle(
                                fontSize: 23,
                                color: Color.fromARGB(255, 90, 90, 90),
                                fontWeight: FontWeight.w600)),
                        const SizedBox(width: 240),
                        if (isLogined == true &&
                            controller.conversationList.length > 0)
                          TextButton(
                            onPressed: () async {
                              //Get.to(() => MyInfoPage());
                              final controller = NavigationController.instance;
                              controller.selectTab(2);
                              final controller2 = MyInfoViewController.instance;
                              await Future.delayed(Duration(milliseconds: 50));

                              controller2.scrollcontroller.value.animateTo(
                                  537.0,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: const Text(
                              '전체보기',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                      ],
                    ),
                  ],
                )),
            if (isLogined == false)
              Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '로그인 후 \n 이어서 대화해보세요!',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextButton(
                    onPressed: () async {
                      Get.toNamed(LoginPage.url);
                    },
                    child: const Text(
                      '로그인 하기 >',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF33C26C),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              )
            else if (controller.conversationList.length > 0)
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    for (int index = 0;
                        index < controller.conversationList.length;
                        index++)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (index == 0)
                            const SizedBox(
                              width: 40,
                            ),
                          OngoingComponent(
                              model: controller.conversationList[index]),
                        ],
                      )
                  ],
                ),
              )
            else
              Column(
                children: [
                  SizedBox(height: 20),
                  Text('아직 진행 중인 대화가 없어요.',
                      style: TextStyle(fontSize: 15, color: Colors.grey)),
                  SizedBox(
                    height: 25,
                  ),
                  TextButton(
                    onPressed: () async {
                      final controller = NavigationController.instance;
                      controller.selectTab(1);
                    },
                    child: const Text(
                      '대화 시작하기 >',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF33C26C),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            const SizedBox(
              height: 35,
            ),
            Row(
              children: const [
                SizedBox(width: 25),
                Text('Best Conversation',
                    style: TextStyle(
                        fontSize: 23,
                        color: Color.fromARGB(255, 90, 90, 90),
                        fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Container(
                  width: 410,
                  height: 892.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(70, 221, 225, 227),
                    border: Border.all(
                      color: const Color.fromARGB(255, 238, 238, 238),
                      width: 1.4,
                    ),
                  ),
                  child: Column(
                    children: [
                      for (int index = 0;
                          index < controller.conversationList.length;
                          index++)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BestTalkingComponent(
                              model: controller.conversationList[index],
                            ),
                            if (index < 9)
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Divider(
                                  height: 1,
                                  thickness: 0.7,
                                  color: Colors.black26,
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ])),
    );
  }
}
