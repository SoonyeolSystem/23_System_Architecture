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
      {"character": "me", "대사": "Oh my god! Where are we?"},
      {"character": "you", "대사": "I have no idea, but we need to find water and shelter fast!"},
      {"character": "me", "대사": "But I can't see anything but sand here!"},
      {"character": "you", "대사": "Let's start walking in that direction. Maybe we'll find something."},
      {"character": "me", "대사": "Oh my god! Where are we?Oh my god! Where are we?Oh my god! Where are we?Oh my god! Where are we?"},
      {"character": "you", "대사": "I have no idea, but we need to find water and shelter fast!"},
      {"character": "me", "대사": "Oh my god! Where are we?"},
    ];

    List<MyInfo> fakeInfos = fakeJsonData.map((jsonData) => MyInfo.fromJson(jsonData)).toList();
    infoList.value = fakeInfos;
    infoList.refresh();
  }

  RxList<MyInfo> infoList = <MyInfo>[].obs;
  RxDouble speakingSpeed = 15.0.obs;
  RxInt speakingCount = 20.obs;
  RxDouble speakingTime = 2.4.obs;
  RxInt talkingScore = 80.obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
