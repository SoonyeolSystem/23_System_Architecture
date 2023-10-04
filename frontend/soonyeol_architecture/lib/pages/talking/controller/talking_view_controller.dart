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
      {"character": "me", "대사": "Oh my god! Where are we?"},
      {
        "character": "you",
        "대사": "I have no idea, but we need to find water and shelter fast!"
      },
      {"character": "me", "대사": "But I can't see anything but sand here!"},
      {
        "character": "you",
        "대사":
            "Let's start walking in that direction. Maybe we'll find something."
      },
      {
        "character": "me",
        "대사":
            "Oh my god! Where are we?Oh my god! Where are we?Oh my god! Where are we?Oh my god! Where are we?"
      },
      {
        "character": "you",
        "대사": "I have no idea, but we need to find water and shelter fast!"
      },
      {"character": "me", "대사": "Oh my god! Where are we?"},
      {
        "character": "you",
        "대사": "I have no idea, but we need to find water and shelter fast!"
      },
      {"character": "me", "대사": "Oh my god! Where are we?"},
      {
        "character": "you",
        "대사": "I have no idea"
      },
      {"character": "me", "대사": "Oh my god! Where are we? gggggggg okay let's take a look."},
      {
        "character": "you",
        "대사": "hello!"
      },
      {"character": "me", "대사": "Oh my god! Where are we?"},
      {
        "character": "you",
        "대사": "I have no idea, but we need to find water and shelter fast!"
      },
    ];

    List<Talking> fakeTalkings =
        fakeJsonData.map((jsonData) => Talking.fromJson(jsonData)).toList();
    talkingList.value = fakeTalkings;
    talkingList.refresh();
  }

  RxList<Talking> talkingList = <Talking>[].obs;
  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
