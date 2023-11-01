//import 'dart:ffi';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_main_view_page.dart';
import '../../../../restAPI/models/MyInfo.dart';

class InfoViewComponent extends StatelessWidget {
  final MyInfo model;
  const InfoViewComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    //final controller = TalkingViewController.instance;
    Common.logger.i(model.genre);
    return InkWell(
      onTap: () {
        Get.toNamed(TalkingViewPage.url);
      },
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: lenScenario(model.scenarioName!),
                            //width: 250,
                            child: Text(
                              "${model.scenarioName}",
                              style: const TextStyle(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 5),
                          for (int i = 0; i < model.genre!.length; i++)
                            Row(
                              children: [
                                Text(
                                  "#",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: model.processivity == 0
                                        ? Color(0xFF33C26C)
                                        : Color.fromARGB(255, 255, 0, 0),
                                  ),
                                ),
                                Text(
                                  model.genre![i],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF808080),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 300,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${model.lastTalking}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: const Color.fromARGB(137, 50, 50, 50),
                                  fontWeight: FontWeight.w200,
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
              const Spacer(),
              Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      padding: EdgeInsets.all(0),
                      icon: const Icon(Icons.close),
                      color: Color.fromARGB(255, 195, 195, 195),
                      iconSize: 19,
                      onPressed: () {
                        showDefaultDialog();
                      }),
                  Text(
                    savedTime(model.savedTime!),
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF808080),
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

void showDefaultDialog() {
  Get.defaultDialog(
    title: '',
    content: const Text('정말 삭제하시겠습니까?\n'),
    contentPadding: EdgeInsets.only(top: 20, bottom: 30, left: 10, right: 10),
    buttonColor: Color(0xFF33C26C),
    textConfirm: '삭제',
    confirmTextColor: Colors.white,
    onConfirm: () {
      Get.back();
      showSnackBar();
    },
    textCancel: '취소',
    onCancel: Get.back,
  );
}

void showSnackBar() {
  Get.snackbar('', '',
      maxWidth: Common.getWidth,
      titleText: Container(),
      messageText: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          '시나리오가 삭제되었습니다.',
          style: TextStyle(color: Colors.white),
        ),
      ),
      colorText: Colors.white,
      backgroundColor: Colors.black,
      snackPosition: SnackPosition.BOTTOM);
}

String savedTime(DateTime savedTime) {
  var nowTime = DateTime.now();

  int difference = nowTime.difference(savedTime).inSeconds;
  if (difference < 60) {
    return '방금 전';
  }

  difference = nowTime.difference(savedTime).inMinutes;

  if (difference < 60) {
    return '$difference분 전';
  } else {
    if (difference < 720) {
      return '${difference ~/ 60}시간 전';
    } else {
      if (difference < 1440) {
        return DateFormat('h:mm').format(savedTime);
      } else {
        return DateFormat('MM/dd').format(savedTime);
      }
    }
  }
}

double lenScenario(String scenarioName) {
  if (scenarioName.length < 20) {
    return (scenarioName.length * 14).toDouble();
  } else
    return 250.0;
}
