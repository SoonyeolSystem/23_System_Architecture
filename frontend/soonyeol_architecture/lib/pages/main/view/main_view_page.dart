import 'package:flutter/material.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';

import '../../../../common/common.dart';

class MainViewPage extends StatelessWidget {
  const MainViewPage({super.key});

  static const String url = '/main';

  @override
  Widget build(BuildContext context) {
    final controller = MainViewController.instance;
    //final controller = Get.put(MainViewController());

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 161, 180, 162),
      body: Center(
        child: Container(
          color: Colors.white,
          width: Common.getWidth,
          //height: Common.getHeight,
          child: Column(
            children: [
              Expanded(
                  child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 28, bottom: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //순열 타이틀, 검색 버튼
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              const Text('SoonYeol',
                                  style: TextStyle(
                                      fontSize: 26,
                                      color: Color(0xFF33C26C),
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                onPressed: () => {},
                                //Get.toNamed(ScenarioMainPage.url),
                                padding: EdgeInsets.only(left: 310.0),
                                icon: const Icon(Icons.search),
                                iconSize: 28,
                              ),
                            ],
                          ),
                          //공간 띄우기
                          SizedBox(height: 40),
                          //커스텀 버튼, 즐겨찾기 버튼
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //커스텀 버튼
                              Container(
                                width: 182,
                                height: 185,
                                child: Material(
                                  child: InkWell(
                                    onTap: () {
                                      // 버튼이 클릭되었을 때 실행되는 코드
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                          end: Alignment.topCenter,
                                          begin: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromARGB(255, 237, 237, 237),
                                            Color(0xFF33C26C)
                                          ], // 그라데이션 색상 설정
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '커스텀\n시나리오',
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                SizedBox(height: 27),
                                                Text(
                                                  '나만의 시나리오를\n직접 만들어보세요!',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black54,
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
                              SizedBox(width: 40),
                              //즐겨찾기 버튼
                              Container(
                                width: 182,
                                height: 185,
                                child: Material(
                                  child: InkWell(
                                    onTap: () {
                                      // 버튼이 클릭되었을 때 실행되는 코드
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xFFE7F8EE),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '즐겨찾기',
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      color: Color(0xFF33C26C)),
                                                  textAlign: TextAlign.left,
                                                ),
                                                SizedBox(height: 70),
                                                Text(
                                                  '즐겨찾기 해놓은 ',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black54),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '시나리오가 ${controller.bookmarkCount.value}개 있어요',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              Colors.black54),
                                                      textAlign:
                                                          TextAlign.center,
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
                          SizedBox(height: 50),
                          //이어서 대화하기
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 25),
                                      const Text('이어서 대화하기',
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: Color.fromARGB(
                                                  255, 90, 90, 90),
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(width: 240),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          '전체보기',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Container(
                                        width: 167,
                                        height: 143,
                                        child: Material(
                                          child: InkWell(
                                            onTap: () {
                                              // 버튼이 클릭되었을 때 실행되는 코드
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color.fromARGB(
                                                      255, 215, 215, 215)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 13),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 100.0),
                                                    child: Icon(
                                                      Icons.chat,
                                                      size: 35,
                                                      color: Color.fromARGB(
                                                          255, 90, 144, 219),
                                                    ),
                                                  ),
                                                  SizedBox(height: 13),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '사막에서 살아남기',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.black,
                                                          ),
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                        SizedBox(height: 15),
                                                        Text(
                                                          '마지막 대화: \nWhere am I? I want to drink water.',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color:
                                                                Colors.black54,
                                                          ),
                                                          textAlign:
                                                              TextAlign.left,
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
