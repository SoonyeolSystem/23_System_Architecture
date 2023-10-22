import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../restAPI/models/Talking.dart';

class TalkingViewController extends GetxController {
  static TalkingViewController get instance =>
      Get.find<TalkingViewController>();
  final FlutterTts tts = FlutterTts();
  final TextEditingController con = TextEditingController();
  late final WebSocketChannel? channel;

  @override
  void onInit() async {
    super.onInit();
    channel = WebSocketChannel.connect(Uri.parse(Common.websocketUrl));

    receiveMessage();
    await getTalkingList();
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

  Future<void> getTalkingList() async {
    List<Map<String, dynamic>> fakeJsonData = [
      {"character": "me", "script": "Oh my god! Where are we?"},
      {
        "character": "you",
        "script": "I have no idea, but we need to find water and shelter fast!"
      },
      {"character": "me", "script": "But I can't see anything but sand here!"},
      {
        "character": "you",
        "script":
            "Let's start walking in that direction. Maybe we'll find something."
      },
      {
        "character": "me",
        "script":
            "Oh my god! Where are we?Oh my god! Where are we?Oh my god! Where are we?Oh my god! Where are we?"
      },
      {
        "character": "you",
        "script": "I have no idea, but we need to find water and shelter fast!"
      },
      {"character": "me", "script": "Oh my god! Where are we?"},
      {
        "character": "you",
        "script": "I have no idea, but we need to find water and shelter fast!"
      },
      {"character": "me", "script": "Oh my god! Where are we?"},
      {"character": "you", "script": "I have no idea"},
      {
        "character": "me",
        "script": "Oh my god! Where are we? gggggggg okay let's take a look."
      },
      {"character": "you", "script": "hello!"},
      {"character": "me", "script": "Oh my god! Where are we?"},
      {
        "character": "you",
        "script": "I have no idea, but we need to find water and shelter fast!"
      },
    ];

    List<Talking> fakeTalkings =
        fakeJsonData.map((jsonData) => Talking.fromJson(jsonData)).toList();
    talkingList.value = fakeTalkings;
    talkingList.refresh();
  }

  Future<void> textTospeech(String text) async {
    tts.setLanguage("en-US");
    tts.setSpeechRate(1);

    await tts.speak(text);
  }

  RxList<Talking> talkingList = <Talking>[].obs;
  RxDouble speakingSpeed = 15.0.obs;
  RxInt speakingCount = 20.obs;
  RxDouble speakingTime = 2.4.obs;
  RxInt talkingScore = 80.obs;
  RxString scenarioname = '사막에서 살아남기'.obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
