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
        "scenario_name": "사막에서 살아남기",
        "장르": ["생존", "공포"],
        "진행도": 0,
        "last_talking": "Where are we?"
      },
      {
        "scenario_name": "사막에서 살아남기",
        "장르": ["생존", "공포"],
        "진행도": 0,
        "last_talking": "Where are we?"
      },
      {
        "scenario_name": "커피 주문하기",
        "장르": ["생활", "주문"],
        "진행도": 0,
        "last_talking": "Would you recommend anything but hot?"
      },
      {
        "scenario_name": "경찰에게 체포되기 직전",
        "장르": ["생존", "스피드"],
        "진행도": 1,
        "last_talking": "OMG! There's no way to run away!"
      },
      {
        "scenario_name": "식당 예약하기",
        "장르": ["생활", "예약"],
        "진행도": 1,
        "last_talking": "Thank you. That's all!"
      },
    ];

    List<MyInfo> fakeInfos =
        fakeJsonData.map((jsonData) => MyInfo.fromJson(jsonData)).toList();
    infoList.value = fakeInfos;
    infoList.refresh();
  }

  RxList<MyInfo> infoList = <MyInfo>[].obs;
  Rx<MyInfo> myinfo = MyInfo().obs;

  RxInt speakingTime = 17.obs;
  RxInt speakingCount = 7.obs;
  RxDouble talkingScore = 7.8.obs;
  RxInt completeScenario = 3.obs;
  RxString userName = '홍길동'.obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
