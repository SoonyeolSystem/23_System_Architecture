import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';
import 'package:soonyeol_architecture/restAPI/models/Conversation.dart';
import 'package:soonyeol_architecture/restAPI/models/Scenario.dart';

class BestTalkingComponent extends StatelessWidget {
  final Conversation model;
  const BestTalkingComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainViewController());
    return Container(
      width: 330,
      height: 70,
      child: Material(
          child: InkWell(
              splashColor:
                  Colors.transparent, // 마우스 클릭 시의 효과 색상 (투명하게 설정하여 효과를 없앰)
              highlightColor: Colors.transparent,
              onTap: () {},
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 13),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFE3F4F9),
                      child: Icon(
                        CupertinoIcons.person_fill,
                        size: 30,
                        color: Color.fromARGB(255, 148, 148, 148),
                      ),
                    ),
                  ),
                  SizedBox(height: 13),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 9,
                              ),
                              Text(
                                "미소",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${model.scenarioname}',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        ],
                      ))
                ],
              )))),
    );

    throw UnimplementedError();
  }
}
