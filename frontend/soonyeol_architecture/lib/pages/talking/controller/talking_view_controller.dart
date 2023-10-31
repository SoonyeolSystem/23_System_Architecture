import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../restAPI/models/Talking.dart';

class TalkingViewController extends GetxController {
  static TalkingViewController get instance =>
      Get.find<TalkingViewController>();
  
  late final WebSocketChannel? channel;
  var isListening = false.obs;
  var speechText = 'press the Mic button  and start speaking'.obs;
  late SpeechToText speechToText;

  FlutterTts tts = FlutterTts();
  final TextEditingController con = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    try{
      channel = WebSocketChannel.connect(Uri.parse(Common.websocketUrl));
    }
    catch(e){
      Get.back();
    }
    receiveMessage();
    speechToText = SpeechToText();
    await getTalkingList();
  }

  @override
  void onClose() {
    channel?.sink.close();
    tts.stop();

    super.onClose();
  }

  void listen() async {
    if (!isListening.value) {
      bool available = await speechToText.initialize(
        onStatus: (val) {},
        onError: (val) {},
      );
      if (available) {
        isListening.value = true;
        speechToText.listen(onResult: (val) {
          speechText.value = val.recognizedWords;
        });
      }
    } else {
      isListening.value = false;
      speechToText.stop();
      speechText.value = '';
    }
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
