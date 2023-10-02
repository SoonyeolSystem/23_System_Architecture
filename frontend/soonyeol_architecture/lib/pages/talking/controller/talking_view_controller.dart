import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../restAPI/models/Talking.dart';

class TalkingViewController extends GetxController {
  static TalkingViewController get instance =>
      Get.find<TalkingViewController>();

  @override
  void onInit() async {
    super.onInit();
    await getTalkingList();
  }

  Future<void> getTalkingList() async {
    List<Map<String, dynamic>> fakeJsonData = [
      {"대사": "hello"},
      {"대사": "hi!!"},
    ];

    List<Talking> fakeTalkings =
        fakeJsonData.map((jsonData) => Talking.fromJson(jsonData)).toList();
    talkingList.value = fakeTalkings;
    talkingList.refresh();
  }

  RxList<Talking> talkingList = <Talking>[].obs;
  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
