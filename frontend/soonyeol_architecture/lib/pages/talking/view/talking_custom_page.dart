import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/talking/controller/talking_custom_controller.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_main_view_page.dart';
import 'package:uuid/uuid.dart';

import '../../../common/common.dart';

class TalkingCustomPage extends StatelessWidget {
  const TalkingCustomPage({super.key});

  static const String url = '/talking/custom';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TalkingCustomViewController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            // 중앙 정렬
            child: Container(
              width: Common.getWidth, // 가로 길이 설정
              color: const Color(0xFF323630),
              child: Column(
                // 세로 중앙 정렬
                crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
                children: [
                  Material(
                    type: MaterialType.transparency,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 10),
                        child: AppBar(
                          elevation: 0.0,
                          centerTitle: true,
                          title: const Text(
                            '시나리오 커스텀',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          ),
                          backgroundColor: Colors.transparent,
                          leading: InkWell(
                            onTap: () {
                              Navigator.pop(context, true);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 25,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    width: Common.getWidth - 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF434343),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // 컨텐츠 가운데 정렬
                        children: [
                          const Text(
                            '이름',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: controller.situationC,
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            maxLines: null,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            '상황',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: controller.situationC,
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            maxLines: null,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            '장르',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: controller.genreC,
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            maxLines: null,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            '주인공',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: controller.nameC,
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            maxLines: null,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            '등장인물',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: controller.characterC,
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            maxLines: null,
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 180,
                        height: 180,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xFF33C26C),
                              width: 2,
                            ),
                            backgroundColor: const Color(0xFF434343),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // 원하는 둥근 모서리 반경을 여기에 지정합니다.
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            '다른 사람이\n추천한\n시나리오',
                            style: TextStyle(fontSize: 23, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        height: 180,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E7649),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // 원하는 둥근 모서리 반경을 여기에 지정합니다.
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            '내가 했던\n시나리오',
                            style: TextStyle(fontSize: 23, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                  SizedBox(
                      width: Common.getWidth - 100,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(TalkingViewPage.url, arguments: {
                            'situationid': const Uuid().v4(),
                            'conversationid': const Uuid().v4(),
                            'situation': controller.situationC.text,
                            'genre': controller.genreC.text,
                            'name': controller.nameC.text,
                            'character': controller.characterC.text,
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF33C26C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          '시작하기',
                          style: TextStyle(fontSize: 22),
                        ),
                      )),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
