import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../restAPI/models/Talking.dart';

class TalkingViewController extends GetxController {
  static TalkingViewController get instance => Get.find<TalkingViewController>();

  late final WebSocketChannel? channel;

  @override
  void onInit() async {
    super.onInit();
    channel = WebSocketChannel.connect(Uri.parse(Common.websocketUrl));

    receiveMessage();
  }

  @override
  void onClose() {
    channel?.sink.close();
    super.onClose();
  }

  void sendMesage() {
    channel?.sink.add('Hello');
  }

  void receiveMessage() {
    channel?.stream.listen((event) {
      final response = jsonDecode(event) as Map<String, dynamic>;
      talkingList.add(Talking.fromJson(response));
      talkingList.refresh();
    });
  }

  // Future<void> getTalkingList() async {
  //   List<Map<String, dynamic>> fakeJsonData = [
  //     {"character": "me", "대사": "Oh my god! Where are we?"},
  //     {"character": "you", "대사": "I have no idea, but we need to find water and shelter fast!"},
  //     {"character": "me", "대사": "But I can't see anything but sand here!"},
  //     {"character": "you", "대사": "Let's start walking in that direction. Maybe we'll find something."},
  //     {"character": "me", "대사": "Oh my god! Where are we?Oh my god! Where are we?Oh my god! Where are we?Oh my god! Where are we?"},
  //     {"character": "you", "대사": "I have no idea, but we need to find water and shelter fast!"},
  //     {"character": "me", "대사": "Oh my god! Where are we?"},
  //     {"character": "you", "대사": "I have no idea, but we need to find water and shelter fast!"},
  //     {"character": "me", "대사": "Oh my god! Where are we?"},
  //     {"character": "you", "대사": "I have no idea"},
  //     {"character": "me", "대사": "Oh my god! Where are we? gggggggg okay let's take a look."},
  //     {"character": "you", "대사": "hello!"},
  //     {"character": "me", "대사": "Oh my god! Where are we?"},
  //     {"character": "you", "대사": "I have no idea, but we need to find water and shelter fast!"},
  //   ];

  //   List<Talking> fakeTalkings = fakeJsonData.map((jsonData) => Talking.fromJson(jsonData)).toList();
  //   talkingList.value = fakeTalkings;
  //   talkingList.refresh();
  // }

  RxList<Talking> talkingList = <Talking>[].obs;
  RxDouble speakingSpeed = 15.0.obs;
  RxInt speakingCount = 20.obs;
  RxDouble speakingTime = 2.4.obs;
  RxInt talkingScore = 80.obs;
  RxString scenarioname = '사막에서 살아남기'.obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
