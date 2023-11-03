import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_main_view_page.dart';
import 'package:soonyeol_architecture/restAPI/models/Conversation.dart';

int index = 1;

class BestTalkingComponent extends StatelessWidget {
  final Conversation model;
  BestTalkingComponent({Key? key, required this.model}) : super(key: key);
  static const List<Color> avatarColors = [
    Color(0xFFE3F4F9),
    Color(0xFFE3F9E7),
    Color(0xFFFCF6D6),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = MainViewController.instance;

    int colorIndex = Random().nextInt(3);
    Color selectedColor = avatarColors[colorIndex];

    return Container(
      width: 407,
      height: 88,
      child: Material(
        child: InkWell(
          onTap: () {
            Get.toNamed(TalkingViewPage.url);
          },
          child: Row(
            children: [
              rank(),
              SizedBox(height: 13),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: CircleAvatar(
                  backgroundColor: selectedColor,
                  child: Icon(
                    CupertinoIcons.person_fill,
                    size: 39,
                    color: Color.fromARGB(255, 148, 148, 148),
                  ),
                ),
              ),
              SizedBox(
                width: 23,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${model.userName}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 7),
                          SizedBox(
                            width: 180,
                            child: Text(
                              '${model.situationname}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                width: 195,
              ),
              Icon(
                model.isLike == true ? Icons.favorite : Icons.favorite_border,
                size: 24,
                color: Color.fromARGB(255, 229, 91, 86),
              ),
              SizedBox(width: 5),
              Text(
                '${model.likeCount}',
                style: const TextStyle(fontSize: 14, color: Color(0xFF434343)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rank() {
    double rank_width = 25;
    if (index == 10) {
      rank_width = 19;
    }

    Widget rankWidget = Row(
      children: [
        SizedBox(width: rank_width),
        Text(
          '$index',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 68, 68, 68),
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(width: rank_width),
      ],
    );
    if (index < 10)
      index++;
    else
      index = 1;
    // 다음 위젯을 위해 인덱스 증가
    return rankWidget;
  }
}
