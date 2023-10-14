import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/my_info/controller/info_controller.dart';
import 'package:soonyeol_architecture/pages/my_info/view/component/myinfo_component.dart';

class MyInfoPage extends StatelessWidget {
  const MyInfoPage({super.key});

  static const String url = '/info';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double mywidth = screenWidth * 0.8;
    final controller = MyInfoViewController.instance;
    return MaterialApp(
        home: Center(
      child: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          controller: controller.scrollcontroller.value,
          physics: const BouncingScrollPhysics(),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                type: MaterialType.transparency,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.085, top: 25.0, bottom: 35),
                        child: const Text(
                          '홍길동 님의 정보',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
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
                            style: TextStyle(fontSize: 18, color: Color(0xFF888888)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5, right: screenWidth * 0.085, top: 2),
                            child: const Icon(
                              Icons.logout,
                              size: 25,
                              color: Color(0xFF888888),
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
                    margin: const EdgeInsets.only(left: 30, right: 0, bottom: 20),
                    height: 270,
                    width: 230,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 242, 242, 242),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.timer,
                          size: 60,
                          //color: Colors.grey,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          '총 학습 시간',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '17',
                              style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              '분',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 0, right: 30, bottom: 20),
                    height: 270,
                    width: 230,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 242, 242, 242),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.question_answer,
                          size: 50,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          '총 말한 문장',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '7',
                              style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              '개',
                              style: TextStyle(fontSize: 20, color: Colors.black),
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
                    margin: const EdgeInsets.only(left: 30, bottom: 40),
                    height: 270,
                    width: 230,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 242, 242, 242),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.emoji_events,
                          size: 50,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          '대화 평균 점수',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '7.8',
                              style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              '점',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 0, right: 30, bottom: 40),
                    height: 270,
                    width: 230,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 242, 242, 242),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.movie,
                          size: 50,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          '완료한 시나리오',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '3',
                              style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              '개',
                              style: TextStyle(fontSize: 20, color: Colors.black),
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
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.085, top: 25.0, bottom: 30),
                  child: const Text(
                    'My 시나리오',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: screenWidth * 0.085, right: screenWidth * 0.085),
                  height: 1.0,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 209, 209, 209)),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: screenWidth * 0.085, bottom: 5),
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 1, 215, 4),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 25.0, bottom: 35),
                      child: Text(
                        '진행중',
                        style: TextStyle(
                            fontSize: 20,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
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
                          InfoViewComponent(model: controller.infoList.value[index]),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10, top: 15),
                          )
                        ],
                      ),
                    );
                  }),
                  childCount: controller.infoList.length,
                )),
              ),
              ////진행중인 시나리오
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: screenWidth * 0.085, bottom: 5),
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 226, 2, 2),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 25.0, bottom: 35),
                      child: Text(
                        '완료',
                        style: TextStyle(
                            fontSize: 20,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              //완료된 시나리오
            ],
          ),
        ),
      ),
    ));
  }
}
