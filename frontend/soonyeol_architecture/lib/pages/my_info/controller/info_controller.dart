import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/restAPI/models/MyInfo.dart';

class MyInfoViewController extends GetxController {
  static MyInfoViewController get instance => Get.find<MyInfoViewController>();
  @override
  void onInit() async {
    super.onInit();
    await getInfoList();

  }

  Future<void> getInfoList() async {
    List<Map<String, dynamic>> fakeJsonData = [
      {
        "situation_name": "비행기 난파 후 아무도 없는 사막에서 살아남기",
        "genre": ["생존", "공포"],
        "progress": 0,
        "last_talking": "Where are we?",
        "saved_time": DateTime.now()
      },
      {
        "situation_name": "사막에서 살아남기",
        "genre": ["생존", "공포"],
        "progress": 0,
        "last_talking": "Where are we?",
        "saved_time": DateTime(2023, 10, 31, 02)
      },
      {
        "situation_name": "커피 주문하기",
        "genre": ["생활", "주문"],
        "progress": 0,
        "last_talking": "Would you recommend anything but iced? It's super hot outside.",
        "saved_time": DateTime(2023, 10, 30, 14, 05)
      },
      {
        "situation_name": "경찰에게 체포되기 직전",
        "genre": ["생존", "스피드"],
        "progress": 1,
        "last_talking": "OMG! There's no way to run away! I think we have to give up.",
        "saved_time": DateTime(2023, 10, 30, 15, 55)
      },
      {
        "situation_name": "식당 예약하기",
        "genre": ["생활", "예약"],
        "progress": 1,
        "last_talking": "Thank you. That's all!",
        "saved_time": DateTime(2023, 10, 31, 12, 05)
      },
    ];

    List<MyInfo> fakeInfos = fakeJsonData.map((jsonData) => MyInfo.fromJson(jsonData)).toList();
    infoList.value = fakeInfos;
    infoList.refresh();
  }

  RxList<MyInfo> infoList = <MyInfo>[].obs;
  Rx<MyInfo> myinfo = MyInfo().obs;

  RxInt speakingTime = 17.obs;
  RxInt speakingCount = 7.obs;
  RxDouble talkingScore = 7.8.obs;
  RxInt completeSituation = 3.obs;
  // RxString nickname= "".obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
