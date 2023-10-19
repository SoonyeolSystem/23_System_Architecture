import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/common/widget/panel_component.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';
import 'package:soonyeol_architecture/pages/scenario/view/component/conversation_component.dart';
import 'package:soonyeol_architecture/pages/scenario/view/component/scenario_choose_page.dart';
import 'package:soonyeol_architecture/pages/scenario/view/scenario_main_view_page.dart';
import 'package:soonyeol_architecture/restAPI/models/Scenario.dart';

import '../../controller/scenario_main_controller.dart';

class ScenarioComponent extends StatelessWidget {
  final Scenario model;
  const ScenarioComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = MainViewController.instance;
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: ((context) {
              return Center(
                child: Container(
                    width: Common.getWidth,
                    child: Column(
                      children: [
                        AppBar(
                          elevation: 0.0,
                          centerTitle: true,
                          title: Text(
                            '${model.scenarioname}',
                            style: TextStyle(
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          backgroundColor: Colors.transparent,
                          leading: InkWell(
                            onTap: () {
                              Navigator.pop(context, true);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  for (int i = 0; i < model.genre!.length; i++)
                                    Row(
                                      children: [
                                        Text(
                                          "#",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF33C26C),
                                          ),
                                        ),
                                        Text(
                                          "${model.genre![i]}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF808080),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(height: 3),
                                          Icon(
                                            model.isbookmark == true
                                                ? Icons.star
                                                : Icons.star_border,
                                            size: 20,
                                            color: model.isbookmark == true
                                                ? Colors.yellow
                                                : Color(0xFF434343),
                                          ),
                                          SizedBox(width: 3),
                                          Text(
                                            "${model.bookmarkcount}",
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Color(0xFF434343)),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        "조회수 ${model.views}회",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFF434343)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 350,
                          width: Common.getWidth,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 244, 244, 246),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '상황',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFF888888)),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "${model.stiuation}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 18),
                                  Text(
                                    '장르',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFF888888)),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      for (int i = 0;
                                          i < model.genre!.length;
                                          i++)
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                "${model.genre![i]}, ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                  SizedBox(height: 18),
                                  Text(
                                    '등장인물',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFF888888)),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      for (int i = 0;
                                          i < model.character!.length;
                                          i++)
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                "${model.character![i]}, ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                  SizedBox(height: 18),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '주인공',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xFF888888)),
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "${model.maincharacter}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xFF33C26C)),
                                          padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 15),
                                          ),
                                        ),
                                        child: Text(
                                          '시작하기',
                                          style: TextStyle(
                                            fontSize:
                                                20, // Text size remains the same
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        SizedBox(height: 20),
                        const SizedBox(
                          width: double.infinity, //가로 꽉 차게 설정
                          height: 15,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 242, 242, 242)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 20, bottom: 25),
                            child: Text(
                              '다른 유저의 Conversation',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: Common.getWidth * 0.03,
                                right: Common.getWidth * 0.03),
                            height: 1.0,
                            width: double.infinity,
                            color: Color.fromARGB(255, 209, 209, 209)),
                        Container(
                          child: Column(
                            children: [
                              for (int index = 0;
                                  index < controller.conversationList.length;
                                  index++)
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // if (index == 0)
                                    //   const SizedBox(
                                    //     width: 40,
                                    //   ),
                                    ConversationComponent(
                                      model: controller.conversationList[index],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 10, top: 15),
                                      child: Divider(
                                        height: 1,
                                        thickness: 1,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    )),
              );
            }));
      },
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${model.scenarioname}",
                          style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          for (int i = 0; i < model.genre!.length; i++)
                            Row(
                              children: [
                                Text(
                                  "#",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF33C26C),
                                  ),
                                ),
                                Text(
                                  "${model.genre![i]}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF808080),
                                  ),
                                ),
                                SizedBox(width: 5)
                              ],
                            ),
                        ],
                      )
                    ]),
              ),
              const Spacer(),
              if (model.isbookmark == true)
                Container(
                  alignment: Alignment.centerRight,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SizedBox(height: 3),
                            Icon(Icons.star, size: 20, color: Colors.yellow),
                            SizedBox(width: 3),
                            Text("${model.bookmarkcount}",
                                style: const TextStyle(
                                    fontSize: 20, color: Color(0xFF434343))),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text("조회수 ${model.views}회",
                            style: const TextStyle(
                                fontSize: 15, color: Color(0xFF434343))),
                      ]),
                ),
              if (model.isbookmark == false)
                Container(
                  alignment: Alignment.centerRight,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SizedBox(height: 3),
                            Icon(Icons.star_border,
                                size: 20, color: Color(0xFF434343)),
                            SizedBox(width: 3),
                            Text("${model.bookmarkcount}",
                                style: const TextStyle(
                                    fontSize: 20, color: Color(0xFF434343))),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text("조회수 ${model.views}회",
                            style: const TextStyle(
                                fontSize: 15, color: Color(0xFF434343))),
                      ]),
                ),
            ],
          ),
        )
      ]),
    );
  }
}
