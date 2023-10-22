import 'dart:io';

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
    //final controller = Get.put(TalkingViewController());
    return InkWell(
      onTap: () {Get.toNamed(TalkingViewPage.url);},
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
                      Text("${model.scenarioName}",
                          style: const TextStyle(fontSize: 18)),
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
                                    color: model.processivity == 0
                                        ? Color(0xFF33C26C)
                                        : Color.fromARGB(255, 255, 0, 0),
                                  ),
                                ),
                                Text(
                                  model.genre![i],
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
              GestureDetector(
                onTap: () {showDefaultDialog();},
                child: Container(
                  margin: EdgeInsets.only(left: 5, top: 2),
                  child: Icon(
                    Icons.delete_outline,
                    size: 30,
                    color: Color(0xFF888888),
                  ),
                ),
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
      content : const Text('정말 삭제하시겠습니까?\n'),
      contentPadding: EdgeInsets.only(top:20, bottom: 30, left: 10, right: 10),
      buttonColor: Color(0xFF33C26C),
      textConfirm: '삭제',
      confirmTextColor: Colors.white,
      onConfirm: (){Get.back();
      showSnackBar();
      
      },
      textCancel: '취소',
      onCancel: Get.back,
    );
  }
void showSnackBar() {
    Get.snackbar(
      '',
      '',
      maxWidth:Common.getWidth,
      titleText: Container(),
      messageText: Padding(
        padding: const EdgeInsets.only(bottom:8.0),
        child: Text('시나리오가 삭제되었습니다.', style: TextStyle(color: Colors.white),),
      ),
      colorText: Colors.white,
      backgroundColor: Colors.black,
      snackPosition: SnackPosition.BOTTOM
    );
  }