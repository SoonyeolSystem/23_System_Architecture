import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/common/move/moveService.dart';
import 'package:soonyeol_architecture/pages/login/view/login_page.dart';
import 'package:soonyeol_architecture/pages/situation/view/component/conversation_component.dart';
import 'package:soonyeol_architecture/restAPI/models/Situation.dart';
import 'package:soonyeol_architecture/service/user_service.dart';

import '../../controller/situation_main_controller.dart';

class SituationComponent extends StatelessWidget {
  final Situation model;
  const SituationComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = SituationMainController.instance;
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: ((context) {
              return SingleChildScrollView(
                  child: Expanded(
                child: Container(
                  color: Colors.white,
                  width: Common.getWidth,
                  height: MediaQuery.of(context).size.height * 1.0,
                  child: Column(
                    children: [
                      AppBar(
                        elevation: 0.0,
                        centerTitle: true,
                        title: SizedBox(
                          width: 380,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  '${model.title}',
                                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ],
                          ),
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
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    Text('${model.userId}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 7),
                                    Row(
                                      children: [
                                        const Text(
                                          "#",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF33C26C),
                                          ),
                                        ),
                                        Text(
                                          "${model.genre}",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF808080),
                                          ),
                                        ),
                                        const SizedBox(width: 5)
                                      ],
                                    ),
                                  ]),
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
                                          const SizedBox(height: 3),
                                          InkWell(
                                            onTap: () {
                                              // Toggle the bookmark status here (change the value of model.isbookmark)
                                              // For example, you can do:
                                              // model.like = !model.like!;
                                            },
                                            child: Icon(
                                              model.like == 1 ? CupertinoIcons.star_fill : CupertinoIcons.star,
                                              size: 22,
                                              //color: model.isbookmark == true ? Colors.yellow : const Color(0xFF434343),
                                              color: Colors.yellow,
                                            ),
                                          ),
                                          const SizedBox(width: 3),
                                          Text(
                                            "${model.likeCount}",
                                            style: const TextStyle(fontSize: 15, color: Color(0xFF434343), fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        "플레이 수 ${model.play ?? "0"}회",
                                        style: const TextStyle(fontSize: 15, color: Color(0xFF434343), fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Container(
                          width: Common.getWidth,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 244, 244, 246),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            '상황',
                                            style: TextStyle(fontSize: 18, color: Color(0xFF888888), fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15.0),
                                          child: Text(
                                            "${model.situation}",
                                            style: const TextStyle(fontSize: 16, color: Color(0xFF000000), fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        const SizedBox(height: 23),
                                      ],
                                    ))
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            '장르',
                                            style: TextStyle(fontSize: 18, color: Color(0xFF888888), fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15.0),
                                          child: Text(
                                            "${model.genre}",
                                            style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        const SizedBox(height: 23),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            '등장인물',
                                            style: TextStyle(fontSize: 18, color: Color(0xFF888888), fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15.0),
                                          child: Text(
                                            "${model.character}",
                                            style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        const SizedBox(height: 23),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            '주인공',
                                            style: TextStyle(fontSize: 18, color: Color(0xFF888888), fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15.0),
                                          child: Text(
                                            "${model.name}",
                                            style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10, bottom: 5),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (!UserService.instance.isLogin()) {
                                            Get.toNamed(LoginPage.url);
                                            return;
                                          }
                                          MoveService.instance.moveTalkingPageBySituation(model);
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(const Color(0xFF33C26C)),
                                          padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(horizontal: 45, vertical: 13),
                                          ),
                                        ),
                                        child: const Text(
                                          '시작하기',
                                          style: TextStyle(
                                            fontSize: 22, // Text size remains the same
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(
                        width: double.infinity, //가로 꽉 차게 설정
                        height: 15,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Color.fromARGB(255, 242, 242, 242)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 30, top: 20, bottom: 25),
                          child: Text(
                            '다른 유저의 Conversation',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: Common.getWidth * 0.03, right: Common.getWidth * 0.03),
                          height: 1.0,
                          width: double.infinity,
                          color: const Color.fromARGB(255, 209, 209, 209)),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Container(
                          child: Column(
                            children: [
                              for (int index = 0; index < controller.conversationList.length; index++)
                                Column(
                                  children: [
                                    ConversationComponent(
                                      model: controller.conversationList[index],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 10, top: 15),
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
                      ),
                    ],
                  ),
                ),
              ));
            }));
      },
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    width: 330,
                    child: Text("${model.title}", style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      const Text(
                        "#",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF33C26C),
                        ),
                      ),
                      Text(
                        "${model.genre}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF808080),
                        ),
                      ),
                      const SizedBox(width: 5)
                      // for (int i = 0; i < model.genre!.length; i++)
                      //   Row(
                      //     children: [
                      //       const Text(
                      //         "#",
                      //         style: TextStyle(
                      //           fontSize: 12,
                      //           color: Color(0xFF33C26C),
                      //         ),
                      //       ),
                      //       Text(
                      //         model.genre![i],
                      //         style: const TextStyle(
                      //           fontSize: 12,
                      //           color: Color(0xFF808080),
                      //         ),
                      //       ),
                      //       const SizedBox(width: 5)
                      //     ],
                      //   ),
                    ],
                  )
                ]),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.centerRight,
                child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Row(
                    children: [
                      const SizedBox(height: 3),
                      Icon(
                        model.like == 1 ? CupertinoIcons.star_fill : CupertinoIcons.star,
                        size: 15,
                        color: model.like == 1 ? Colors.yellow : const Color(0xFF434343),
                      ),
                      const SizedBox(width: 3),
                      Text("${model.likeCount}", style: const TextStyle(fontSize: 15, color: Color(0xFF434343), fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text("플레이 수 ${model.play}회", style: const TextStyle(fontSize: 13, color: Color(0xFF434343), fontWeight: FontWeight.w500)),
                ]),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
